import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/app_scaffold.dart';
import '../../widgets/bordered_text.dart';
import 'basic_with_animated_builder.dart';
import 'basic_with_animated_widget.dart';
import 'basic_with_transition.dart';

final basicAnimationPageProvider = StateProvider((ref) => 0.0);

const pages = <Widget>[
  BasicWithAnimatedBuilder(),
  BasicWithAnimatedWidget(),
  BasicWithTransition(),
];

class BasicAnimationScreen extends HookConsumerWidget {
  const BasicAnimationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: const BorderedText(
        text: 'BASIC',
        textColor: Colors.white,
        borderColor: Colors.blue,
        fontSize: 24,
        strokeWidth: 5,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 8),
        child: Consumer(
          builder: (context, ref, _) => DotsIndicator(
            dotsCount: pages.length,
            position: ref.watch(basicAnimationPageProvider),
          ),
        ),
      ),
      color: Colors.yellow,
      body: PageView(
        controller: controller,
        onPageChanged: (value) =>
            ref.read(basicAnimationPageProvider.notifier).update(
                  (state) => value.toDouble(),
                ),
        children: pages,
      ),
    );
  }
}
