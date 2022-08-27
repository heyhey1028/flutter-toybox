import 'package:animation_playground/widgets/base_button.dart';
import 'package:animation_playground/widgets/bordered_text.dart';
import 'package:flutter/material.dart';
import '/widgets/app_scaffold.dart';

class BasicAnimationScreen extends StatefulWidget {
  const BasicAnimationScreen({super.key});

  @override
  State<BasicAnimationScreen> createState() => _BasicAnimationScreenState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _BasicAnimationScreenState extends State<BasicAnimationScreen>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late Tween<Offset> _tween;
  late Animation<Offset> _animation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // 4. prepare Tween
    _tween = Tween<Offset>(begin: const Offset(0, -1000), end: Offset.zero);
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
    return AppScaffold(
      title: const BorderedText(
        text: 'BASIC',
        textColor: Colors.white,
        borderColor: Colors.blue,
        fontSize: 24,
        strokeWidth: 5,
      ),
      color: Colors.yellow,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Center(
                child: Transform.translate(
                  offset: _animation.value,
                  child: Image.asset(
                    'assets/images/dash_bird_pc.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: BaseButton(
                onPressed: () => _onPressed(_controller),
                text: !hasAppeared ? 'FORWARD' : 'BACKWARD',
              ),
            ),
          ),
        ],
      ),
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
