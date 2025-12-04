class TrendingNewsModel {
  const TrendingNewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.publisherIcon,
    required this.publisher,
    required this.category,
    required this.date,
    required this.isVerified,
  });

  final int id;
  final String title;
  final String image;
  final String publisherIcon;
  final String publisher;
  final String category;
  final String date;
  final bool isVerified;

  factory TrendingNewsModel.fromJson(Map<String, dynamic> json) {
    return TrendingNewsModel(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      publisherIcon: (json['publisher_icon'] as String?) ?? '',
      publisher: (json['publisher'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      date: (json['date'] as String?) ?? '',
      isVerified: (json['is_verified'] as bool?) ?? false,
    );
  }
}
