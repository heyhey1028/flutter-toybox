import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http_requests/features/screens/user_accounts_screen.dart';
import 'package:http_requests/features/screens/users_screen.dart';
import 'package:http_requests/main.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
          name: 'users',
          path: '/users',
          builder: (context, state) => const UsersScreen(),
          routes: [
            GoRoute(
              name: 'user_accounts',
              path: ':id/accounts',
              builder: (context, state) {
                final id = state.params['id']!;
                return UserAccountsScreen(userId: id);
              },
            ),
          ])
    ],
  ),
);
