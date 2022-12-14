import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_requests/features/api_client.dart';
import 'package:http_requests/features/models/account.dart';

final accountRepositoryProvider =
    Provider((ref) => AccountRepository(ref.read(apiClientProvider)));

class AccountRepository {
  const AccountRepository(this.apiClient);

  static String endpoint = '/accounts';
  final ApiClient apiClient;

  Future<List<Account>> getAccountsByUserId(int userId) async {
    final response = await apiClient.get('/users/$userId$endpoint');
    final data = jsonDecode(response) as List<dynamic>;
    return data
        .map<Account>(
            (dynamic e) => Account.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> getAccountById(int accountId) async {
    final result = await apiClient.get('$endpoint/$accountId');
    print(result);
  }
}
