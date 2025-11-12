class DataModel {
  const DataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.source,
  });

  final int id;
  final String title;
  final String description;
  final String image;
  final String source;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      source: (json['source'] as String?) ?? '',
    );
  }

  bool get isForbes => source.toLowerCase() == 'forbes';
}
