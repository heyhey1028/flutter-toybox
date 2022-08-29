import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class MultipleWithAnimBuilder extends StatefulWidget {
  const MultipleWithAnimBuilder({super.key});

  @override
  State<MultipleWithAnimBuilder> createState() =>
      _MultipleWithAnimBuilderState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _MultipleWithAnimBuilderState extends State<MultipleWithAnimBuilder>
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
                  'With AnimatedBuilder: ',
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
