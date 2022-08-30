import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

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
                'assets/images/dash_bird_power.png',
              ),
            ),
          ),
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
                  'With Transition: ',
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
