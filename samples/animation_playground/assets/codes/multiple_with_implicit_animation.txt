import 'package:animation_playground/widgets/base_button.dart';
import 'package:flutter/material.dart';

class MultipleWithImplicitAnimation extends StatefulWidget {
  const MultipleWithImplicitAnimation({super.key});

  @override
  State<MultipleWithImplicitAnimation> createState() =>
      _MultipleWithImplicitAnimationState();
}

// 1. no SingleTickerProviderStateMixin is needed for ImplicitlyAnimatedWidgets
class _MultipleWithImplicitAnimationState
    extends State<MultipleWithImplicitAnimation> {
  // 2. define the initial value for ImplicitlyAnimatedWidget
  double scale = 1;
  Widget image = const CircleAvatar(backgroundColor: Colors.blue);

  bool hasAppeared = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 800),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              child: image,
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
                  'With Implicit: ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BaseButton(
                  onPressed: _onPressed,
                  text: !hasAppeared ? 'IN' : 'OUT',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onPressed() {
    if (scale == 1) {
      setState(() {
        scale = 1.5;
        image = Image.asset('assets/images/dash_bird_power.png');
        hasAppeared = false;
      });
      return;
    }
    setState(() {
      scale = 1;
      image = const CircleAvatar(backgroundColor: Colors.blue);
      hasAppeared = true;
    });
  }
}
