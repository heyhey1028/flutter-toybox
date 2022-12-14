import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_requests/features/api_client.dart';
import 'package:http_requests/features/models/user.dart';

final userRepositoryProvider =
    Provider((ref) => UserRepository(ref.read(apiClientProvider)));

class UserRepository {
  UserRepository(this.apiClient);

  static String endpoint = '/users';
  ApiClient apiClient;

  Future<void> getAllUsers() async {
    final result = await apiClient.get(endpoint);
    print(result);
  }
}
