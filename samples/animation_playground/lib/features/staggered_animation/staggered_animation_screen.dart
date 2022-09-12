import 'package:animation_playground/features/staggered_animation/staggered_animation.dart';
import 'package:animation_playground/features/staggered_animation/staggered_chained_animation.dart';
import 'package:animation_playground/features/staggered_animation/staggered_multiple_effect_animation.dart';
import 'package:animation_playground/features/staggered_animation/staggered_sequenced_animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/app_scaffold.dart';
import '../../widgets/bordered_text.dart';

final staggeredAnimationPageProvider = StateProvider((ref) => 0.0);

const pages = <Widget>[
  StaggeredAnimationSample(),
  StaggeredSequencedAnimationSample(),
  StaggeredMultipleEffectAnimationSample(),
  StaggeredChainedAnimationSample(),
];

class StaggeredAnimationScreen extends HookConsumerWidget {
  const StaggeredAnimationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: const BorderedText(
        text: 'STAGGERED ANIMATION',
        textColor: Colors.white,
        borderColor: Colors.blue,
        fontSize: 16,
        strokeWidth: 5,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 8),
        child: Consumer(
          builder: (context, ref, _) => DotsIndicator(
            dotsCount: pages.length,
            position: ref.watch(staggeredAnimationPageProvider),
          ),
        ),
      ),
      color: Colors.purple,
      body: PageView(
        controller: controller,
        onPageChanged: (value) =>
            ref.read(staggeredAnimationPageProvider.notifier).update(
                  (state) => value.toDouble(),
                ),
        children: pages,
      ),
    );
  }
}
