import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http_requests/features/models/user.dart';
import 'package:http_requests/features/repositories/account_repository.dart';
import 'package:http_requests/features/repositories/user_repository.dart';
import 'package:http_requests/features/view_models/users_screen_view_model.dart';
import 'package:http_requests/utils/async_builder.dart';
import 'package:http_requests/widgets/app_scaffold.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: SingleChildScrollView(
        child: AsyncBuilder<List<User>>(
          provider: usersScreenViewModelProvider,
          builder: (context, users) {
            return Column(
              children: users.map((user) => _UserListItem(user: user)).toList(),
            );
          },
        ),
      ),
    );
  }
}

class _UserListItem extends StatelessWidget {
  const _UserListItem({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/users/${user.id}/accounts'),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Text(user.name),
      ),
    );
  }
}
