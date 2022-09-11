import 'package:animation_playground/features/multiple_effects/multiple_with_implicit_animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/app_scaffold.dart';
import '../../widgets/bordered_text.dart';
import 'multiple_with_animated_widget.dart';
import 'multiple_with_animated_builder.dart';
import 'multiple_with_transition.dart';

final multipleEffectsPageProvider = StateProvider((ref) => 0.0);

const pages = [
  MultipleWithAnimatedBuilder(),
  MultipleWithAnimatedWidget(),
  MultipleWithTransition(),
  MultipleWithImplicitAnimation(),
];

class MultipleEffectsScreen extends HookConsumerWidget {
  const MultipleEffectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: const BorderedText(
        text: 'MULTIPLE EFFECTS',
        textColor: Colors.white,
        borderColor: Colors.blue,
        fontSize: 18,
        strokeWidth: 5,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 8),
        child: Consumer(
          builder: (context, ref, _) => DotsIndicator(
            dotsCount: pages.length,
            position: ref.watch(multipleEffectsPageProvider),
          ),
        ),
      ),
      color: Colors.orange,
      body: PageView(
        controller: controller,
        onPageChanged: (value) =>
            ref.read(multipleEffectsPageProvider.notifier).update(
                  (state) => value.toDouble(),
                ),
        children: pages,
      ),
    );
  }
}
