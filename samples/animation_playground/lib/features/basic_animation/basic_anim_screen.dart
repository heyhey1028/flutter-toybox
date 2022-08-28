import 'package:animation_playground/features/basic_animation/basic_with_animated_widget.dart';
import 'package:animation_playground/features/basic_animation/basic_with_animation_builder.dart';
import 'package:animation_playground/features/basic_animation/basic_with_slide_transition.dart';
import 'package:animation_playground/widgets/bordered_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '/widgets/app_scaffold.dart';

final pageProvider = StateProvider((ref) => 0.0);

class BasicAnimationScreen extends HookConsumerWidget {
  const BasicAnimationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: Column(
        children: [
          const BorderedText(
            text: 'BASIC',
            textColor: Colors.white,
            borderColor: Colors.blue,
            fontSize: 24,
            strokeWidth: 5,
          ),
          const SizedBox(height: 4),
          Consumer(
            builder: (context, ref, _) => DotsIndicator(
              dotsCount: 3,
              position: ref.watch(pageProvider),
            ),
          ),
        ],
      ),
      color: Colors.yellow,
      body: PageView(
        controller: controller,
        onPageChanged: (value) => ref.read(pageProvider.notifier).update(
              (state) => value.toDouble(),
            ),
        children: const [
          BasicWithAnimBuilder(),
          BasicWithAnimatedWidget(),
          BasicWithSlideTransition(),
        ],
      ),
    );
  }
}
