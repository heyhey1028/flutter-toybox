import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_requests/features/app_api_exception.dart';

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

  Future<String> _guardApiCall(Function callback) async {
    try {
      final response = await callback.call() as http.Response;
      return _validateResponse(response.statusCode, response.body);
    } on Exception catch (e) {
      if (e is SocketException) {
        throw AppApiException.noInternet();
      }
      rethrow;
    }
  }

  Future<String> get(String endpoint) async {
    return _guardApiCall(() async => http.get(Uri.parse('$baseUrl$endpoint')));
  }

  String _validateResponse(int statusCode, String body) {
    switch (statusCode) {
      case 200:
      case 201:
        return body;
      case 400:
        throw AppApiException.badRequest();
      case 401:
        throw AppApiException.unAuthorized();
      case 403:
        throw AppApiException.forbidden();
      case 404:
        throw AppApiException.notFound();
      case 500:
        throw AppApiException.internalServerError();
      default:
        throw AppApiException.unknown();
    }
  }
}
