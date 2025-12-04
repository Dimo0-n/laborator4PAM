class DataModel {
  const DataModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.publisher,
    required this.publisherIcon,
    required this.publisherVerified,
    required this.image,
    this.isFollowing = false,
    this.likes,
    this.comments,
    this.shares,
    this.isBookmarked = false,
  });

  final int id;
  final String title;
  final String category;
  final String date;
  final String publisher;
  final String publisherIcon;
  final bool publisherVerified;
  final String image;
  final bool isFollowing;
  final int? likes;
  final int? comments;
  final int? shares;
  final bool isBookmarked;

  factory DataModel.fromRecommendationJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      date: (json['date'] as String?) ?? '',
      publisher: (json['publisher'] as String?) ?? '',
      publisherIcon: (json['publisher_icon'] as String?) ?? '',
      publisherVerified: (json['publisher_verified'] as bool?) ?? false,
      image: (json['image'] as String?) ?? '',
      isFollowing: (json['is_following'] as bool?) ?? false,
    );
  }

  factory DataModel.fromDetailsNewsJson(Map<String, dynamic> json) {
    final Map<String, dynamic> stats =
        (json['stats'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    return DataModel(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      date: (json['date'] as String?) ?? '',
      publisher: (json['publisher'] as String?) ?? '',
      publisherIcon: (json['publisher_icon'] as String?) ?? '',
      publisherVerified: (json['publisher_verified'] as bool?) ?? false,
      image: (json['image'] as String?) ?? '',
      likes: (stats['likes'] as num?)?.toInt(),
      comments: (stats['comments'] as num?)?.toInt(),
      shares: (stats['shares'] as num?)?.toInt(),
      isBookmarked: (json['is_bookmarked'] as bool?) ?? false,
    );
  }

  bool get isForbes => publisher.toLowerCase() == 'forbes';
}
