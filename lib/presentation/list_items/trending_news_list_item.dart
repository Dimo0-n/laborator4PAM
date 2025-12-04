import 'package:lab2/domain/models/trending_news_model.dart';

import 'home_list_item.dart';

class TrendingNewsListItem extends HomeListItem {
  const TrendingNewsListItem(this.items);

  final List<TrendingNewsModel> items;
}
