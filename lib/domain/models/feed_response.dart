import 'data_model.dart';
import 'trending_news_model.dart';

class FeedUser {
  const FeedUser({
    required this.name,
    required this.profileImage,
    required this.notificationCount,
  });

  final String name;
  final String profileImage;
  final int notificationCount;

  factory FeedUser.fromJson(Map<String, dynamic> json) {
    return FeedUser(
      name: (json['name'] as String?) ?? '',
      profileImage: (json['profile_image'] as String?) ?? '',
      notificationCount: (json['notification_count'] as num?)?.toInt() ?? 0,
    );
  }
}

class FeedResponse {
  const FeedResponse({
    required this.user,
    required this.trendingNews,
    required this.recommendations,
  });

  final FeedUser user;
  final List<TrendingNewsModel> trendingNews;
  final List<DataModel> recommendations;

  factory FeedResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> trendingJson =
        (json['trending_news'] as List<dynamic>? ?? <dynamic>[]);
    final List<dynamic> recommendationsJson =
        (json['recommendations'] as List<dynamic>? ?? <dynamic>[]);

    return FeedResponse(
      user: FeedUser.fromJson(
        (json['user'] as Map<String, dynamic>? ?? <String, dynamic>{}),
      ),
      trendingNews: trendingJson
          .map((dynamic item) => TrendingNewsModel.fromJson(
                item as Map<String, dynamic>,
              ))
          .toList(),
      recommendations: recommendationsJson
          .map((dynamic item) => DataModel.fromRecommendationJson(
                item as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}
