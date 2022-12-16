import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http_requests/features/app_api_exception.dart';

import '../../utils/async_builder.dart';
import '../models/user.dart';
import '../view_models/users_screen_view_model.dart';

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
