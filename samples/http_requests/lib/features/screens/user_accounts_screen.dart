import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../utils/async_builder.dart';
import '../app_api_exception.dart';
import '../models/account.dart';
import '../models/user_accounts_screen_state.dart';
import '../view_models/user_accounts_screen_view_model.dart';

extension on num {
  String formatToYen() {
    return '${NumberFormat('#,##0').format(this)}円';
  }
}

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
                _UserInfo(
                  name: user?.name,
                  totalBalance: totalBalance,
                ),
                const SizedBox(height: 56),
                _AccountList(accounts: accounts),
              ],
            ),
          );
        },
        //
        errorBuilder: (context, e, s) {
          var message = e.toString();

          if (e is AppApiException) {
            message = e.message;
          }

          return Center(
            child: Text(message),
          );
        },
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    this.name,
    required this.totalBalance,
  });

  final String? name;
  final int totalBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _UserName(name: name),
          const SizedBox(height: 16),
          _TotalBalance(totalBalance: totalBalance),
        ],
      ),
    );
  }
}

class _UserName extends ConsumerWidget {
  const _UserName({
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('User:'),
        Text(name ?? ''),
      ],
    );
  }
}

class _TotalBalance extends ConsumerWidget {
  const _TotalBalance({
    required this.totalBalance,
  });

  final int totalBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total:'),
        Text(totalBalance.formatToYen()),
      ],
    );
  }
}

class _AccountList extends StatelessWidget {
  const _AccountList({
    required this.accounts,
  });

  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: accounts
          .map((account) => _AccountListItem(account: account))
          .toList(),
    );
  }
}

class _AccountListItem extends ConsumerWidget {
  const _AccountListItem({
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
          Text(account.balance.formatToYen()),
        ],
      ),
    );
  }
}
