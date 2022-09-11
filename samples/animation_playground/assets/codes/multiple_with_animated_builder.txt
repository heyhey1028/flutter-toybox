import 'package:flutter/material.dart';

import '../../constants/sample_page.dart';
import '../../widgets/control_container.dart';

class MultipleWithAnimatedBuilder extends StatefulWidget {
  const MultipleWithAnimatedBuilder({super.key});

  @override
  State<MultipleWithAnimatedBuilder> createState() =>
      _MultipleWithAnimatedBuilderState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _MultipleWithAnimatedBuilderState
    extends State<MultipleWithAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  // 2. define AnimationController & Tween & Animation
  late AnimationController _controller;
  late Tween<Offset> _offsetTween;
  late Tween<double> _opacityTween;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  bool hasAppeared = false;

  @override
  void initState() {
    // 3. initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    // 4. prepare Tween
    _offsetTween =
        Tween<Offset>(begin: const Offset(0, -300), end: Offset.zero);
    _opacityTween = Tween(begin: 0, end: 1);
    // 5. create Animation by AnimationController x Tween
    _offsetAnimation = _controller.drive(_offsetTween);
    _opacityAnimation = _controller.drive(_opacityTween);
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
          // 6. merging animations to be apply multiple effects to within AnimatedBuilder
          animation: Listenable.merge([
            _offsetAnimation,
            _opacityAnimation,
          ]),
          builder: (context, _) {
            return Center(
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.translate(
                  offset: _offsetAnimation.value,
                  child: Image.asset(
                    'assets/images/dash_bird_power.png',
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            );
          },
        ),
        ControlContainer(
          controller: _controller,
          sample: SamplePage.multipleWithAnimatedBuilder,
        ),
      ],
    );
  }
}
