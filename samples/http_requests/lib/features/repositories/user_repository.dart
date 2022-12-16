import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_client.dart';
import '../models/user.dart';

final userRepositoryProvider =
    Provider((ref) => UserRepository(ref.read(apiClientProvider)));

class UserRepository {
  UserRepository(this.apiClient);

  static String endpoint = '/users';
  ApiClient apiClient;

  Future<List<User>> getAllUsers() async {
    final response = await apiClient.get(endpoint);
    final data = jsonDecode(response) as List<dynamic>;
    return data
        .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<User?> getUserById(int userId) async {
    return (await getAllUsers()).firstWhere((user) => user.id == userId);
  }
}
