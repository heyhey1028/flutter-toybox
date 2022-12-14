import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/screens/users_screen.dart';
import '../main.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100]!,
                    foregroundImage:
                        const AssetImage('assets/images/flutter_logo.png'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('FLUTTER TOY BOX'),
                ],
              ),
            ),
            DrawerTile(
              color: Colors.lightBlue[100]!,
              icon: const Icon(Icons.home),
              title: 'HOME',
              path: '/',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.indigo[100]!,
              icon: const Icon(Icons.notes),
              title: 'Users',
              path: '/users',
              navigateTo: const UsersScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    this.title,
    this.icon,
    this.color,
    required this.path,
    this.navigateTo,
    this.fontFamily,
  });

  final String? title;
  final Icon? icon;
  final Color? color;
  final String path;
  final Widget? navigateTo;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: ListTile(
        leading: icon,
        title: Text(
          title ?? '',
          style: TextStyle(fontFamily: fontFamily),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {
          Navigator.of(context).pop();
          // Navigator.of(context).pushReplacement<void, void>(
          //   MaterialPageRoute(
          //     builder: (_) => navigateTo ?? const MyHomePage(),
          //   ),
          // );
          context.go(path);
        },
      ),
    );
  }
}
