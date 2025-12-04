import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/feed_details_response.dart';
import '../models/feed_response.dart';

class DataRepository {
  DataRepository({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const String _baseUrl = 'https://test-api-jlbn.onrender.com/v4';

  Future<FeedResponse> loadFeed() async {
    final Uri uri = Uri.parse('$_baseUrl/feed');
    final http.Response response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load feed (${response.statusCode})');
    }
    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;
    return FeedResponse.fromJson(decoded);
  }

  Future<FeedDetailsResponse> loadFeedDetails() async {
    final Uri uri = Uri.parse('$_baseUrl/feed/details');
    final http.Response response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load feed details (${response.statusCode})');
    }
    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;
    return FeedDetailsResponse.fromJson(decoded);
  }
}
