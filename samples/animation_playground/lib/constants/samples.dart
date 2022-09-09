enum Sample {
  staggeredAnimation(
    subTitle: 'Simple staggered animations',
    codePath: 'assets/codes/staggered_animation.txt',
    url:
        'https://github.com/heyhey1028/flutter-toybox/blob/feature/8_animation_playground/samples/animation_playground/lib/features/staggered_animation/staggered_animation.dart',
  );

  const Sample({
    required this.subTitle,
    required this.codePath,
    required this.url,
  });

  final String subTitle;
  final String codePath;
  final String url;
}
