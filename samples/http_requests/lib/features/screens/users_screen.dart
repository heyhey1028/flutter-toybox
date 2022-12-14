import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http_requests/features/repositories/account_repository.dart';
import 'package:http_requests/features/repositories/user_repository.dart';
import 'package:http_requests/widgets/app_scaffold.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: const Text('Users'),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('Alice'),
              onTap: () => context.go('/users/1/accounts'),
            ),
            ListTile(
              title: Text('Bob'),
              onTap: () {
                ref.read(accountRepositoryProvider).getAccountsByUserId(2);
              },
            ),
            ListTile(
              title: Text('Carlo'),
              onTap: () {
                ref.read(accountRepositoryProvider).getAccountsByUserId(3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(userRepositoryProvider).getAllUsers(),
        child: Icon(
          Icons.plus_one,
        ),
      ),
    );
  }
}
