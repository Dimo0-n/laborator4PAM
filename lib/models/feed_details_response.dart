import 'data_model.dart';

class PublisherStats {
  const PublisherStats({
    required this.newsCount,
    required this.followers,
    required this.following,
  });

  final String newsCount;
  final String followers;
  final int following;

  factory PublisherStats.fromJson(Map<String, dynamic> json) {
    return PublisherStats(
      newsCount: (json['news_count'] as String?) ?? '',
      followers: (json['followers'] as String?) ?? '',
      following: (json['following'] as num?)?.toInt() ?? 0,
    );
  }
}

class PublisherInfo {
  const PublisherInfo({
    required this.username,
    required this.name,
    required this.verified,
    required this.logo,
    required this.bio,
    required this.stats,
    required this.isFollowing,
  });

  final String username;
  final String name;
  final bool verified;
  final String logo;
  final String bio;
  final PublisherStats stats;
  final bool isFollowing;

  factory PublisherInfo.fromJson(Map<String, dynamic> json) {
    return PublisherInfo(
      username: (json['username'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      verified: (json['verified'] as bool?) ?? false,
      logo: (json['logo'] as String?) ?? '',
      bio: (json['bio'] as String?) ?? '',
      stats: PublisherStats.fromJson(
        (json['stats'] as Map<String, dynamic>? ?? <String, dynamic>{}),
      ),
      isFollowing: (json['is_following'] as bool?) ?? false,
    );
  }
}

class FeedFilters {
  const FeedFilters({
    required this.sortBy,
    required this.activeSort,
    required this.viewMode,
  });

  final List<String> sortBy;
  final String activeSort;
  final String viewMode;

  factory FeedFilters.fromJson(Map<String, dynamic> json) {
    return FeedFilters(
      sortBy: List<String>.from((json['sort_by'] as List<dynamic>? ?? <dynamic>[])
          .map((dynamic item) => item.toString())),
      activeSort: (json['active_sort'] as String?) ?? '',
      viewMode: (json['view_mode'] as String?) ?? '',
    );
  }
}

class FeedDetailsResponse {
  const FeedDetailsResponse({
    required this.publisher,
    required this.filters,
    required this.news,
  });

  final PublisherInfo publisher;
  final FeedFilters filters;
  final List<DataModel> news;

  factory FeedDetailsResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> newsJson = (json['news'] as List<dynamic>? ?? <dynamic>[]);
    return FeedDetailsResponse(
      publisher: PublisherInfo.fromJson(
        (json['publisher'] as Map<String, dynamic>? ?? <String, dynamic>{}),
      ),
      filters: FeedFilters.fromJson(
        (json['filters'] as Map<String, dynamic>? ?? <String, dynamic>{}),
      ),
      news: newsJson
          .map((dynamic item) => DataModel.fromDetailsNewsJson(
                item as Map<String, dynamic>,
              ))
          .toList(),
    );
  }
}
