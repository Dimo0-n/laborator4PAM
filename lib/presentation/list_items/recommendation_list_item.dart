import 'package:lab2/domain/models/data_model.dart';

import 'home_list_item.dart';

class RecommendationListItem extends HomeListItem {
  const RecommendationListItem({
    this.recommendation,
    this.isHomePage = true,
  });

  final bool isHomePage;
  final DataModel? recommendation;
}
