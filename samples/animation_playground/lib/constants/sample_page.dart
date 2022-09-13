enum SamplePage {
  basicWithAnimatedWidget(
    subTitle: 'With AnimatedWidget',
    codePath: 'assets/codes/basic_with_animated_widget.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_animated_widget.dart',
  ),
  basicWithAniamatedBuilder(
    subTitle: 'With Animated Builder',
    codePath: 'assets/codes/basic_with_animated_builder.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_animated_builder.dart',
  ),
  basicWithTransition(
    subTitle: 'With Transition',
    codePath: 'assets/codes/basic_with_transition.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/basic_animation/basic_with_transition.dart',
  ),
  curveWithCurvedAnimation(
    subTitle: 'With CurvedAnimation',
    codePath: 'assets/codes/curve_with_curved_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/curved_animation/with_curved_animation.dart',
  ),
  curveWithCurveTween(
    subTitle: 'With CurveTween',
    codePath: 'assets/codes/curve_with_curve_tween.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/curved_animation/with_cruve_tween.dart',
  ),
  multipleWithAnimatedWidget(
    subTitle: 'With AnimatedWidget',
    codePath: 'assets/codes/multiple_with_animated_widget.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/multiple_effects/multiple_with_animated_widget.dart',
  ),
  multipleWithAnimatedBuilder(
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
  ),
  staggeredSequencedAnimation(
    subTitle: 'Staggered and Sequenced animations',
    codePath: 'assets/codes/staggered_sequenced_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/staggered_animation/staggered_animation.dart',
  ),
  staggeredMultipleEffectAnimation(
    subTitle: 'Staggered Multiple Effect animations',
    codePath: 'assets/codes/staggered_multiple_effect_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/staggered_animation/staggered_animation.dart',
  ),
  staggeredChainedAnimation(
    subTitle: 'Staggered Chained animations',
    codePath: 'assets/codes/staggered_chained_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/staggered_animation/staggered_animation.dart',
  ),
  ;

  const SamplePage({
    required this.subTitle,
    required this.codePath,
    required this.url,
  });

  final String subTitle;
  final String codePath;
  final String url;
}
