import 'package:animation_playground/features/chain_animation/chain_multiple_effects.dart';
import 'package:animation_playground/features/chain_animation/chain_with_animated_widget.dart';
import 'package:animation_playground/features/chain_animation/chain_with_animation_builder.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/app_scaffold.dart';
import '../../widgets/bordered_text.dart';

final pageProvider = StateProvider((ref) => 0.0);

const pages = <Widget>[
  ChainWithAnimBuilder(),
  ChainWithAnimatedWidget(),
  ChainMultipleEffects(),
];

class ChainAnimationScreen extends HookConsumerWidget {
  const ChainAnimationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: Column(
        children: [
          const BorderedText(
            text: 'CHAIN ANIMATION',
            textColor: Colors.white,
            borderColor: Colors.blue,
            fontSize: 20,
            strokeWidth: 5,
          ),
          const SizedBox(height: 4),
          Consumer(
            builder: (context, ref, _) => DotsIndicator(
              dotsCount: pages.length,
              position: ref.watch(pageProvider),
            ),
          ),
        ],
      ),
      color: Colors.pink,
      body: PageView(
        controller: controller,
        onPageChanged: (value) => ref.read(pageProvider.notifier).update(
              (state) => value.toDouble(),
            ),
        children: pages,
      ),
    );
  }
}
