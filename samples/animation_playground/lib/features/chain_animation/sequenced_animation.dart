import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class SequencedAnimationSample extends StatefulWidget {
  const SequencedAnimationSample({super.key});

  @override
  State<SequencedAnimationSample> createState() =>
      _SequencedAnimationSampleState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _SequencedAnimationSampleState extends State<SequencedAnimationSample>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late TweenSequence<Alignment> _tween;
  late Animation<Alignment> _alignAnimation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    // 4. prepare TweenSequence
    _tween = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: const Alignment(-1, 3),
            end: Alignment.topLeft,
          ).chain(
            CurveTween(curve: Curves.fastLinearToSlowEaseIn),
          ),
          weight: 2,
        ),
        TweenSequenceItem(
          tween: ConstantTween(Alignment.topLeft),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ConstantTween(Alignment.topRight),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: Alignment.topRight,
            end: Alignment.center,
          ).chain(
            CurveTween(curve: Curves.easeIn),
          ),
          weight: 2.5,
        ),
      ],
    );
    // 5. create Animation by AnimationController x Tween
    _alignAnimation = _controller.drive(_tween);
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
        AnimatedBuilder(
          // 6. merging animations to be apply multiple effects to within AnimatedBuilder
          animation: _alignAnimation,
          builder: (context, _) {
            return Align(
              alignment: _alignAnimation.value,
              child: Image.asset(
                'assets/images/dash_bird_pencil.png',
                width: 200,
                height: 200,
              ),
            );
          },
        ),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.chainedSequencedAnimation,
        ),
      ],
    );
  }
}
