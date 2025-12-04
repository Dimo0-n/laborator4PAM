// ignore_for_file: file_names

import 'package:get/get.dart';

import 'controller_status.dart';
import 'list_items/data_model_list_item.dart';
import 'list_items/home_list_item.dart';
import 'list_items/recommendation_list_item.dart';
import 'list_items/trending_news_list_item.dart';
import 'list_items/welcome_list_item.dart';
import 'models/data_model.dart';
import 'models/feed_response.dart';
import 'models/trending_news_model.dart';
import 'repositories/data_repository.dart';

class MainController extends GetxController {
  MainController({DataRepository? repository})
      : _repository = repository ?? DataRepository();

  final DataRepository _repository;

  final RxList<HomeListItem> items = <HomeListItem>[].obs;
  final RxList<DataModel> dataModels = <DataModel>[].obs;
  final RxList<TrendingNewsModel> trendingNews = <TrendingNewsModel>[].obs;
  final Rx<ControllerStatus> status = ControllerStatus.loading.obs;
  final RxnString errorMessage = RxnString();

  final RxString _userName = 'Tyler'.obs;
  static const String _welcomeSubtitle =
      'Discover a world of news that matters to you';

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    status.value = ControllerStatus.loading;
    errorMessage.value = null;
    try {
      final FeedResponse feed = await _repository.loadFeed();
      _userName.value = feed.user.name.isNotEmpty ? feed.user.name : 'Tyler';
      dataModels.assignAll(feed.recommendations);
      trendingNews.assignAll(feed.trendingNews);
      items.assignAll(_buildItems());
      status.value = ControllerStatus.loaded;
    } catch (e) {
      status.value = ControllerStatus.error;
      errorMessage.value = e.toString();
      items.clear();
    }
  }

  void changeName() {
    _userName.value = _userName.value == 'Tyler' ? 'Tyler' : 'Tyler';
    if (status.value == ControllerStatus.loaded) {
      items.assignAll(_buildItems());
    }
  }

  List<HomeListItem> _buildItems() {
    final List<HomeListItem> baseItems = [
      WelcomeListItem(
        userName: _userName.value,
        subtitle: _welcomeSubtitle,
      ),
      TrendingNewsListItem(trendingNews.toList()),
    ];
    if (dataModels.isNotEmpty) {
      baseItems.add(
        RecommendationListItem(
          isHomePage: true,
          recommendation: dataModels.first,
        ),
      );
      if (dataModels.length > 1) {
        baseItems.addAll(
          dataModels.skip(1).map((data) => DataModelListItem(data)),
        );
      }
    }
    return baseItems;
  }
}
