import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:lab2/domain/models/feed_details_response.dart';
import 'package:lab2/domain/models/feed_response.dart';
import 'package:lab2/utils/constants.dart';

class DataRepository {
  DataRepository({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<FeedResponse> loadFeed() async {
    final Uri uri = Uri.parse('${AppConstants.baseApiUrl}/feed');
    final http.Response response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load feed (${response.statusCode})');
    }
    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;
    return FeedResponse.fromJson(decoded);
  }

  Future<FeedDetailsResponse> loadFeedDetails() async {
    final Uri uri = Uri.parse('${AppConstants.baseApiUrl}/feed/details');
    final http.Response response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load feed details (${response.statusCode})');
    }
    final Map<String, dynamic> decoded =
        jsonDecode(response.body) as Map<String, dynamic>;
    return FeedDetailsResponse.fromJson(decoded);
  }
}
