enum SamplePage {
  basicWithAnimatedWidget(
    subTitle: 'With AnimatedWidget',
    codePath: 'assets/codes/basic_with_animated_widget.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_animated_widget.dart',
  ),
  basicWithAniamtionBuilder(
    subTitle: 'With Animation Builder',
    codePath: 'assets/codes/basic_with_animation_builder.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_animation_builder.dart',
  ),
  basicWithTransition(
    subTitle: 'With Transition',
    codePath: 'assets/codes/basic_with_transition.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_transition.dart',
  ),
  multipleWithAnimatedWidget(
    subTitle: 'With AnimatedWidget',
    codePath: 'assets/codes/multiple_with_animated_widget.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/multiple_effects/multiple_with_animated_widget.dart',
  ),
  multipleWithAnimationBuilder(
    subTitle: 'With Animation Builder',
    codePath: 'assets/codes/multiple_with_animation_builder.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/multiple_effects/multiple_with_animation_builder.dart',
  ),
  multipleWithImplicitAnimation(
    subTitle: 'With Implicit Animations',
    codePath: 'assets/codes/multiple_with_implicit_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/multiple_effects/multiple_with_implicit_animation.dart',
  ),
  multipleWithTransition(
    subTitle: 'With Transitions',
    codePath: 'assets/codes/multiple_with_transition.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/multiple_effects/multiple_with_transition.dart',
  ),
  chainedAnimation(
    subTitle: 'Chained Animation',
    codePath: 'assets/codes/chained_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/chain_animation/chained_animation.dart',
  ),
  sequencedAnimation(
    subTitle: 'Sequenced Animation',
    codePath: 'assets/codes/sequenced_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/chain_animation/sequenced_animation.dart',
  ),
  chainedSequencedAnimation(
    subTitle: 'Chained Sequenced Animation',
    codePath: 'assets/codes/chained_sequenced_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/chain_animation/chained_sequenced_animation.dart',
  ),
  staggeredAnimation(
    subTitle: 'Simple staggered animations',
    codePath: 'assets/codes/staggered_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/staggered_animation/staggered_animation.dart',
  );

  const SamplePage({
    required this.subTitle,
    required this.codePath,
    required this.url,
  });

  final String subTitle;
  final String codePath;
  final String url;
}
