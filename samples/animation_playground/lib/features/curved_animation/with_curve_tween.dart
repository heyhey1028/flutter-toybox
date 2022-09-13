import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class WithCurveTween extends StatefulWidget {
  const WithCurveTween({super.key});

  @override
  State<WithCurveTween> createState() => _WithCurveTweenState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _WithCurveTweenState extends State<WithCurveTween>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late Animatable<Alignment> _tween;
  late Animation<Alignment> _animation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    // 4. prepare Tween
    _tween = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).chain(
      CurveTween(
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    // 5. create Animation by AnimationController x Tween
    _animation = _controller.drive(_tween);
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
        AnimatedDashBird(animation: _animation),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.curveWithCurveTween,
        ),
      ],
    );
  }
}

class AnimatedDashBird extends AnimatedWidget {
  const AnimatedDashBird({
    super.key,
    required Animation<Alignment> animation,
  }) : super(listenable: animation);

  Animation<Alignment> get _offset => listenable as Animation<Alignment>;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _offset.value,
      child: Image.asset(
        DashBird.bunny.path,
        width: 200,
        height: 200,
      ),
    );
  }
}
