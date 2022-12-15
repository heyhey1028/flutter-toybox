import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_requests/features/models/user_accounts_screen_state.dart';
import 'package:http_requests/features/repositories/user_repository.dart';

import '../repositories/account_repository.dart';

final userAccountsScreenViewModel = StateNotifierProvider.autoDispose
    .family<UserAccountsViewModel, AsyncValue<UserAccountsScreenState>, int>(
        // ignore: unnecessary_lambdas
        (ref, int userId) => UserAccountsViewModel(ref, userId));

class UserAccountsViewModel
    extends StateNotifier<AsyncValue<UserAccountsScreenState>> {
  UserAccountsViewModel(
    this._ref,
    this.userId,
  ) : super(const AsyncValue.loading()) {
    fetchData();
  }

  final Ref _ref;
  final int userId;

  Future<void> fetchData() async {
    state = await AsyncValue.guard(
      () async {
        final user =
            await _ref.read(userRepositoryProvider).getUserById(userId);

        final accounts = await _ref
            .read(accountRepositoryProvider)
            .getAccountsByUserId(userId);

        var totalBalance = 0;
        for (final account in accounts) {
          totalBalance += account.balance;
        }

        return UserAccountsScreenState(
          user: user,
          totalBalance: totalBalance,
          accounts: accounts,
        );
      },
    );
  }
}
