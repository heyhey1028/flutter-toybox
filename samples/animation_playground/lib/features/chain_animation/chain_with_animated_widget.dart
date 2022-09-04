import 'dart:math';

import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class ChainWithAnimatedWidget extends StatefulWidget {
  const ChainWithAnimatedWidget({super.key});

  @override
  State<ChainWithAnimatedWidget> createState() =>
      _ChainWithAnimatedWidgetState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _ChainWithAnimatedWidgetState extends State<ChainWithAnimatedWidget>
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
      begin: const Alignment(-1, 3),
      end: Alignment.topLeft,
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
            'assets/images/dash_bird_pencil.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
