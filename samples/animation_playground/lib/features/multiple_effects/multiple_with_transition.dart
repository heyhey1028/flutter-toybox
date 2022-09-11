import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class MultipleWithTransition extends StatefulWidget {
  const MultipleWithTransition({super.key});

  @override
  State<MultipleWithTransition> createState() => _MultipleWithTransitionState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _MultipleWithTransitionState extends State<MultipleWithTransition>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late Tween<double> _fadeTween;
  late Tween<double> _scaleTween;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // 4. prepare Tween
    _fadeTween = Tween<double>(begin: 0, end: 1);
    _scaleTween = Tween<double>(begin: 5, end: 1);
    // 5. create Animation by AnimationController x Tween
    _fadeAnimation = _controller.drive(_fadeTween);
    _scaleAnimation = _controller.drive(_scaleTween);
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
        // 6. nest transition widget to apply multiple effects
        ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Image.asset(
                DashBird.power.path,
              ),
            ),
          ),
        ),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.multipleWithTransition,
        ),
      ],
    );
  }
}
