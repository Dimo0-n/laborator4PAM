import 'package:get/get.dart';

import 'controller_status.dart';
import 'models/feed_details_response.dart';
import 'repositories/data_repository.dart';

class DetailsController extends GetxController {
  DetailsController({DataRepository? repository})
      : _repository = repository ?? DataRepository();

  final DataRepository _repository;

  final Rx<ControllerStatus> status = ControllerStatus.loading.obs;
  final Rxn<FeedDetailsResponse> details = Rxn<FeedDetailsResponse>();
  final RxnString errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadDetails();
  }

  Future<void> loadDetails() async {
    status.value = ControllerStatus.loading;
    errorMessage.value = null;
    try {
      details.value = await _repository.loadFeedDetails();
      status.value = ControllerStatus.loaded;
    } catch (e) {
      status.value = ControllerStatus.error;
      errorMessage.value = e.toString();
    }
  }
}
