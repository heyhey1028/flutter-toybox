import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/widgets/app_scaffold.dart';

class AnimationPlaygroundScreen extends ConsumerWidget {
  const AnimationPlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      color: Colors.yellow,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/dash_bird_pc.png',
            width: 100,
            height: 100,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Button(
                  onPressed: () {},
                  text: 'move around',
                ),
                SizedBox(height: 16),
                _Button(
                  onPressed: () {},
                  text: 'multiple widget',
                ),
                SizedBox(height: 16),
                _Button(
                  onPressed: () {},
                  text: '',
                ),
                SizedBox(height: 16),
                _Button(
                  onPressed: () {},
                  text: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({
    this.text,
    this.onPressed,
  });

  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Text(text ?? ''),
    );
  }
}
