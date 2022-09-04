import 'dart:math';

import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class ChainMultipleEffects extends StatefulWidget {
  const ChainMultipleEffects({super.key});

  @override
  State<ChainMultipleEffects> createState() => _ChainMultipleEffectsState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _ChainMultipleEffectsState extends State<ChainMultipleEffects>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
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
        AnimatedDashBird(controller: _controller),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 60,
              right: 40,
              left: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'With ChainMultipleEffects: ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BaseButton(
                  onPressed: () => _onPressed(_controller),
                  text: !hasAppeared ? 'IN' : 'OUT',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onPressed(
    AnimationController controller,
  ) {
    if (controller.status == AnimationStatus.completed) {
      controller.reverse();
      setState(() => hasAppeared = false);
      return;
    }
    controller.forward();
    setState(() => hasAppeared = true);
  }
}

class AnimatedDashBird extends AnimatedWidget {
  const AnimatedDashBird({
    super.key,
    required AnimationController controller,
  })  : _controller = controller,
        super(
          listenable: controller,
        );

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final sequencedRotateAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 0, end: 6 * pi), weight: 3),
      TweenSequenceItem(tween: ConstantTween(0), weight: 4),
    ]).animate(_controller);

    final sequencedOpacityAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(tween: ConstantTween(1), weight: 5),
        TweenSequenceItem(tween: Tween(begin: 1, end: 0), weight: 2),
        TweenSequenceItem(tween: ConstantTween(0), weight: 3),
        TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 1),
      ],
    ).animate(_controller);

    final sequencedAlignAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
            tween: Tween(begin: const Alignment(-1, 3), end: Alignment.topLeft)
                .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
            weight: 2),
        TweenSequenceItem(tween: ConstantTween(Alignment.topLeft), weight: 1),
        TweenSequenceItem(
            tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
            weight: 1),
        TweenSequenceItem(
            tween: Tween(begin: Alignment.topRight, end: Alignment.bottomLeft),
            weight: 1),
        TweenSequenceItem(
            tween:
                Tween(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
            weight: 1),
        TweenSequenceItem(
            tween: ConstantTween(Alignment.bottomRight), weight: 2),
        TweenSequenceItem(
            tween: Tween(begin: Alignment.bottomRight, end: Alignment.center)
                .chain(CurveTween(curve: Curves.easeIn)),
            weight: 1),
        TweenSequenceItem(tween: ConstantTween(Alignment.center), weight: 1),
      ],
    ).animate(_controller);

    return Align(
      alignment: sequencedAlignAnimation.value,
      child: Opacity(
        opacity: sequencedOpacityAnimation.value,
        child: Transform.rotate(
          angle: sequencedRotateAnimation.value,
          child: Image.asset(
            'assets/images/dash_bird_pencil.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
