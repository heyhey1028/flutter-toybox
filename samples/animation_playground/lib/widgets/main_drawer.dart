import 'package:animation_playground/features/chain_animation/chain_animation_screen.dart';
import 'package:animation_playground/features/curved_animation/curved_animation_screen.dart';
import 'package:animation_playground/features/multiple_effects/multiple_effects_screen.dart';
import 'package:animation_playground/features/staggered_animation/staggered_animation_screen.dart';
import 'package:flutter/material.dart';

import '../features/basic_animation/basic_anim_screen.dart';
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
                    backgroundColor: Colors.grey[100],
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
              color: Colors.lightBlue[100],
              icon: const Icon(Icons.home),
              title: 'HOME',
              navigateTo: const MyHomePage(),
            ),
            DrawerTile(
              color: Colors.yellow[100],
              icon: const Icon(Icons.start),
              title: 'BASIC',
              navigateTo: const BasicAnimationScreen(),
            ),
            DrawerTile(
              color: Colors.green[100],
              icon: const Icon(Icons.waves),
              title: 'CURVED ANIMATION',
              navigateTo: const CurvedAnimationScreen(),
            ),
            DrawerTile(
              color: Colors.orange[100],
              icon: const Icon(Icons.multiple_stop),
              title: 'MULTIPLE EFFECTS',
              navigateTo: const MultipleEffectsScreen(),
            ),
            DrawerTile(
              color: Colors.pink[100],
              icon: const Icon(Icons.bubble_chart),
              title: 'CHAIN ANIMATION',
              navigateTo: const ChainAnimationScreen(),
            ),
            DrawerTile(
              color: Colors.purple[100],
              icon: const Icon(Icons.bar_chart),
              title: 'STAGGERED ANIMATION',
              navigateTo: const StaggeredAnimationScreen(),
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
    this.navigateTo,
    this.fontFamily,
  });

  final String? title;
  final Icon? icon;
  final Color? color;
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
          Navigator.of(context).pushReplacement<void, void>(
            MaterialPageRoute(
              builder: (_) => navigateTo ?? const MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
