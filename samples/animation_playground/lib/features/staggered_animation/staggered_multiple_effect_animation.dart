import 'dart:math';

import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class StaggeredMultipleEffectAnimationSample extends StatefulWidget {
  const StaggeredMultipleEffectAnimationSample({super.key});

  @override
  State<StaggeredMultipleEffectAnimationSample> createState() =>
      _StaggeredMultipleEffectAnimationSampleState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _StaggeredMultipleEffectAnimationSampleState
    extends State<StaggeredMultipleEffectAnimationSample>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
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
          sample: SamplePage.staggeredMultipleEffectAnimation,
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

  @override
  Widget build(BuildContext context) {
    final birdOneOffsetAnimation = Tween<Offset>(
      begin: const Offset(-500, 0),
      end: const Offset(500, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.6,
        ),
      ),
    );
    final birdOneRotateAnimation = Tween<double>(
      begin: 0,
      end: pi * 8,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.6,
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
            offset: birdOneOffsetAnimation.value,
            child: Transform.rotate(
              angle: birdOneRotateAnimation.value,
              child: Image.asset(
                DashBird.coffee.path,
                width: 200,
                height: 120,
              ),
            ),
          ),
          Transform.translate(
            offset: _getOffsetAnimation(_controller, 0.1, 0.7).value,
            child: Transform.rotate(
              angle: _getRotateAnimation(_controller, 0.1, 0.7).value,
              child: Image.asset(
                DashBird.nightcap.path,
                width: 200,
                height: 120,
              ),
            ),
          ),
          Transform.translate(
            offset: _getOffsetAnimation(_controller, 0.2, 0.8).value,
            child: Transform.rotate(
              angle: _getRotateAnimation(_controller, 0.2, 0.8).value,
              child: Image.asset(
                DashBird.glasses.path,
                width: 200,
                height: 120,
              ),
            ),
          ),
          Transform.translate(
            offset: _getOffsetAnimation(_controller, 0.3, 0.9).value,
            child: Transform.rotate(
              angle: _getRotateAnimation(_controller, 0.3, 0.9).value,
              child: Image.asset(
                DashBird.rockstar.path,
                width: 200,
                height: 120,
              ),
            ),
          ),
          Transform.translate(
            offset: _getOffsetAnimation(_controller, 0.4, 1).value,
            child: Transform.rotate(
              angle: _getRotateAnimation(_controller, 0.4, 1).value,
              child: Image.asset(
                DashBird.superdash.path,
                width: 200,
                height: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Animation<Offset> _getOffsetAnimation(
    AnimationController controller,
    double begin,
    double end,
  ) {
    return Tween<Offset>(
      begin: const Offset(-500, 0),
      end: const Offset(500, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          begin,
          end,
        ),
      ),
    );
  }

  Animation<double> _getRotateAnimation(
    AnimationController controller,
    double begin,
    double end,
  ) {
    return Tween<double>(
      begin: 0,
      end: pi * 8,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          begin,
          end,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
  }
}
