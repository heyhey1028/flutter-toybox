import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAccountsScreen extends ConsumerWidget {
  const UserAccountsScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Details for $userId')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Users:'),
                    Text('Alice'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:'),
                    Text('400,000円'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text('A'),
                ),
                ListTile(
                  title: Text('B'),
                ),
                ListTile(
                  title: Text('C'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountListItem extends ConsumerWidget {
  const AccountListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(),
    );
  }
}
