import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class BasicWithAnimatedWidget extends StatefulWidget {
  const BasicWithAnimatedWidget({super.key});

  @override
  State<BasicWithAnimatedWidget> createState() =>
      _BasicWithAnimatedWidgetState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _BasicWithAnimatedWidgetState extends State<BasicWithAnimatedWidget>
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
    _tween = Tween<Offset>(begin: const Offset(-1000, 0), end: Offset.zero);
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
    required Animation<Offset> animation,
  }) : super(listenable: animation);

  Animation<Offset> get _offset => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: _offset.value,
        child: Image.asset(
          'assets/images/dash_bird_pc.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
