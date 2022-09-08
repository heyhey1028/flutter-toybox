import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/widgets/app_scaffold.dart';
import '../../widgets/bordered_text.dart';
import 'chained_animation.dart';
import 'chained_sequenced_animation.dart';
import 'sequenced_animation.dart';

final chainAnimationPageProvider = StateProvider((ref) => 0.0);

const pages = <Widget>[
  SequencedAnimationSample(),
  ChainedAnimationSample(),
  ChainedSequencedAnimationSample(),
];

const pagePath = <String>[
  'lib/features/chain_animation/sequenced_animation.dart',
  'lib/features/chain_animation/chained_animation.dart',
  'lib/features/chain_animation/chained_sequence_animation.dart',
];

class ChainAnimationScreen extends HookConsumerWidget {
  const ChainAnimationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    return AppScaffold(
      title: const BorderedText(
        text: 'CHAIN ANIMATION',
        textColor: Colors.white,
        borderColor: Colors.blue,
        fontSize: 20,
        strokeWidth: 5,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 8),
        child: Consumer(
          builder: (context, ref, _) => DotsIndicator(
            dotsCount: pages.length,
            position: ref.watch(chainAnimationPageProvider),
          ),
        ),
      ),
      color: Colors.pink,
      body: PageView(
        controller: controller,
        onPageChanged: (value) =>
            ref.read(chainAnimationPageProvider.notifier).update(
                  (state) => value.toDouble(),
                ),
        children: pages,
      ),
    );
  }
}
