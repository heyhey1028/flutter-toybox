import 'package:animation_playground/constants/dash_bird.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class BasicWithAnimatedBuilder extends StatefulWidget {
  const BasicWithAnimatedBuilder({super.key});

  @override
  State<BasicWithAnimatedBuilder> createState() =>
      _BasicWithAnimatedBuilderState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _BasicWithAnimatedBuilderState extends State<BasicWithAnimatedBuilder>
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
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Center(
              child: Transform.translate(
                offset: _animation.value,
                child: Image.asset(
                  DashBird.pc.path,
                  width: 200,
                  height: 200,
                ),
              ),
            );
          },
        ),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.basicWithAniamatedBuilder,
        ),
      ],
    );
  }
}
