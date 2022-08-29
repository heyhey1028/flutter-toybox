import 'dart:math';

import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class MultipleWithAnimatedWidget extends StatefulWidget {
  const MultipleWithAnimatedWidget({super.key});

  @override
  State<MultipleWithAnimatedWidget> createState() =>
      _MultipleWithAnimatedWidgetState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _MultipleWithAnimatedWidgetState extends State<MultipleWithAnimatedWidget>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late Tween<double> _opacityTween;
  late Animation<double> _opacityAnimation;
  late Tween<double> _rotateTween;
  late Animation<double> _rotateAnimation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // 4. prepare Tween
    _opacityTween = Tween<double>(begin: 0, end: 1);
    _rotateTween = Tween<double>(begin: 0, end: 8 * pi);
    // 5. create Animation by AnimationController x Tween
    _opacityAnimation = _controller.drive(_opacityTween);
    _rotateAnimation = _controller.drive(_rotateTween);
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
        AnimatedDashBird(
          opacityAnimation: _opacityAnimation,
          rotateAnimation: _rotateAnimation,
        ),
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
                  'With AnimatedWidget: ',
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
  AnimatedDashBird({
    super.key,
    required Animation<double> opacityAnimation,
    required Animation<double> rotateAnimation,
  })  : _opacityAnimation = opacityAnimation,
        _rotateAnimation = rotateAnimation,
        super(
          listenable: Listenable.merge(
            [
              opacityAnimation,
              rotateAnimation,
            ],
          ),
        );

  final Animation<double> _opacityAnimation;
  final Animation<double> _rotateAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.rotate(
          angle: _rotateAnimation.value,
          child: Image.asset(
            'assets/images/dash_bird_power.png',
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}
