import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

class ApiClient {
  factory ApiClient(
      {String baseUrl = 'https://mfx-recruit-dev.herokuapp.com'}) {
    return _instance ??= ApiClient._internal(baseUrl);
  }

  ApiClient._internal(this.baseUrl);

  static ApiClient? _instance;

  final String baseUrl;

  static const header = <String, String>{'content-type': 'application/json'};

  Future<String> _safeApiCall(Function callback) async {
    try {
      final response = await callback() as http.Response;
      return _parseResponse(response.statusCode, response.body);
    } on SocketException catch (e) {
      throw Exception('No Internet Connection');
    }
  }

  Future<String> get(String endpoint) async {
    return _safeApiCall(() async => http.get(Uri.parse('$baseUrl$endpoint')));
  }

  Future<String> post(String endpoint, {required String body}) async {
    return '';
  }

  Future<String> put(String endpoint, {required String body}) async {
    return '';
  }

  Future<String> delete(String endpoint) async {
    return '';
  }

  String _parseResponse(int statusCode, String body) {
    switch (statusCode) {
      case 200:
      case 201:
        return body;
      case 400:
        throw Exception('400 Bad Request');
      case 401:
        throw Exception('401 Unauthorized');
      case 403:
        throw Exception('403 Forbidden');
      case 404:
        throw Exception('404 Not Found');
      case 500:
        throw Exception('500 Internal Server Error');
      default:
        throw Exception('Http Status $statusCode Unkown Error');
    }
  }
}
