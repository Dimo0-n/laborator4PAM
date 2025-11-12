class TrendingNewsModel {
  const TrendingNewsModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.logoPath,
    required this.source,
    required this.tag,
    required this.date,
  });

  final int id;
  final String title;
  final String imagePath;
  final String logoPath;
  final String source;
  final String tag;
  final String date;

  factory TrendingNewsModel.fromJson(Map<String, dynamic> json) {
    return TrendingNewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      logoPath: json['logoPath'] as String,
      source: json['source'] as String,
      tag: json['tag'] as String,
      date: json['date'] as String,
    );
  }
}
