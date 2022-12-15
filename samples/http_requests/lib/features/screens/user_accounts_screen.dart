import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_requests/features/models/account.dart';
import 'package:http_requests/features/models/user_accounts_screen_state.dart';
import 'package:http_requests/features/view_models/user_accounts_screen_view_model.dart';
import 'package:http_requests/utils/async_builder.dart';

class UserAccountsScreen extends ConsumerWidget {
  const UserAccountsScreen({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: false,
      ),
      body: AsyncBuilder<UserAccountsScreenState>(
        provider: userAccountsScreenViewModel(userId),
        builder: (context, state) {
          final user = state.user;
          final totalBalance = state.totalBalance;
          final accounts = state.accounts;

          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    UserInfo(name: user?.name),
                    TotalBalance(totalBalance: totalBalance),
                  ],
                ),
                Column(
                  children: accounts
                      .map((account) => AccountListItem(account: account))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserInfo extends ConsumerWidget {
  const UserInfo({
    super.key,
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Users:'),
          Text(name ?? ''),
        ],
      ),
    );
  }
}

class TotalBalance extends ConsumerWidget {
  const TotalBalance({
    super.key,
    required this.totalBalance,
  });

  final int totalBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total:'),
          Text('$totalBalance'),
        ],
      ),
    );
  }
}

class AccountListItem extends ConsumerWidget {
  const AccountListItem({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(account.name),
          Text('${account.balance}'),
        ],
      ),
    );
  }
}
