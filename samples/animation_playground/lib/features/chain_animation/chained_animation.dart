import 'dart:math';

import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class ChainedAnimationSample extends StatefulWidget {
  const ChainedAnimationSample({super.key});

  @override
  State<ChainedAnimationSample> createState() => _ChainedAnimationSampleState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _ChainedAnimationSampleState extends State<ChainedAnimationSample>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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
        ControlContainer(
          controller: _controller,
          sample: SamplePage.chainedAnimation,
        ),
      ],
    );
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
    final alignAnimation = Tween<Alignment>(
      begin: const Alignment(0, 3),
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );

    final rotateAnimation = Tween<double>(
      begin: 0,
      end: 6 * pi,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.4,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );

    final opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.8,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    return Align(
      alignment: alignAnimation.value,
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Transform.rotate(
          angle: rotateAnimation.value,
          child: Image.asset(
            DashBird.pencil.path,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
