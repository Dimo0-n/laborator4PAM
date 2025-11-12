import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/data_model.dart';
import '../models/trending_news_model.dart';

class DataRepository {
  Future<List<DataModel>> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded
        .map((dynamic item) =>
            DataModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<TrendingNewsModel>> loadTrendingNews() async {
    final String jsonString =
        await rootBundle.loadString('assets/trending_news.json');
    final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
    return decoded
        .map((dynamic item) => TrendingNewsModel.fromJson(
            item as Map<String, dynamic>))
        .toList();
  }
}
