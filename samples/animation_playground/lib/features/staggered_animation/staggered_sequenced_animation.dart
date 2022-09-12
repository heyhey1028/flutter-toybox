import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class StaggeredSequencedAnimationSample extends StatefulWidget {
  const StaggeredSequencedAnimationSample({super.key});

  @override
  State<StaggeredSequencedAnimationSample> createState() =>
      _StaggeredSequencedAnimationSampleState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _StaggeredSequencedAnimationSampleState
    extends State<StaggeredSequencedAnimationSample>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedDashBirds(controller: _controller),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.staggeredSequencedAnimation,
        ),
      ],
    );
  }
}

class AnimatedDashBirds extends AnimatedWidget {
  const AnimatedDashBirds({
    super.key,
    required AnimationController controller,
  })  : _controller = controller,
        super(
          listenable: controller,
        );

  final AnimationController _controller;

  static final tweenSequence = TweenSequence<Offset>([
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(-1000, 0),
        end: const Offset(-150, 0),
      ),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: ConstantTween(const Offset(-150, 0)),
      weight: 2,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(-150, 0),
        end: const Offset(150, 0),
      ),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: ConstantTween(const Offset(150, 0)),
      weight: 2,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(150, 0),
        end: Offset.zero,
      ),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: ConstantTween(Offset.zero),
      weight: 2,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: Offset.zero,
        end: const Offset(-1000, 0),
      ),
      weight: 1,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    final birdOneAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.6,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdTwoAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          0.7,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdThreeAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          0.8,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdFourAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.3,
          0.9,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdFiveAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.4,
          1,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 120),
          Transform.translate(
            offset: birdOneAnimation.value,
            child: Image.asset(
              DashBird.coffee.path,
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdTwoAnimation.value,
            child: Image.asset(
              DashBird.nightcap.path,
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdThreeAnimation.value,
            child: Image.asset(
              DashBird.glasses.path,
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdFourAnimation.value,
            child: Image.asset(
              DashBird.rockstar.path,
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdFiveAnimation.value,
            child: Image.asset(
              DashBird.superdash.path,
              width: 200,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }

  // Animation<Offset> _getAnimation(
  //   AnimationController controller,
  //   double begin,
  //   double end,
  // ) {
  //   return Tween<Offset>(
  //     begin: const Offset(-1000, 0),
  //     end: Offset.zero,
  //   ).animate(
  //     CurvedAnimation(
  //       parent: controller,
  //       curve: Interval(
  //         begin,
  //         end,
  //         curve: Curves.fastLinearToSlowEaseIn,
  //       ),
  //     ),
  //   );
  // }
}
