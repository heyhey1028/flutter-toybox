import 'package:animation_playground/widgets/code_modal_content.dart';
import 'package:flutter/material.dart';

import '../../widgets/base_button.dart';

class StaggeredAnimationSample extends StatefulWidget {
  const StaggeredAnimationSample({super.key});

  @override
  State<StaggeredAnimationSample> createState() =>
      _StaggeredAnimationSampleState();
}

// 1. define StatefulWidget with SingleTickerProviderStateMixin
class _StaggeredAnimationSampleState extends State<StaggeredAnimationSample>
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
        const CodeButton(
          path: 'assets/codes/staggered_animation.txt',
        ),
        AnimatedDashBirds(controller: _controller),
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
                  'Simple staggered animations: ',
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

class AnimatedDashBirds extends AnimatedWidget {
  const AnimatedDashBirds({
    super.key,
    required AnimationController controller,
  })  : _controller = controller,
        super(
          listenable: controller,
        );

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final birdOneAnimation = Tween<Offset>(
      begin: const Offset(-1000, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.3,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdTwoAnimation = Tween<Offset>(
      begin: const Offset(-1000, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.1,
          0.4,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdThreeAnimation = Tween<Offset>(
      begin: const Offset(-1000, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          0.5,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdFourAnimation = Tween<Offset>(
      begin: const Offset(-1000, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.3,
          0.6,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final birdFiveAnimation = Tween<Offset>(
      begin: const Offset(-1000, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.4,
          0.7,
          // curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 120),
          Transform.translate(
            offset: birdOneAnimation.value,
            child: Image.asset(
              'assets/images/dash_bird_coffee.png',
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdTwoAnimation.value,
            child: Image.asset(
              'assets/images/dash_bird_nightcap.png',
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdThreeAnimation.value,
            child: Image.asset(
              'assets/images/dash_bird_glasses.png',
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdFourAnimation.value,
            child: Image.asset(
              'assets/images/dash_bird_rockstar.png',
              width: 200,
              height: 120,
            ),
          ),
          Transform.translate(
            offset: birdFiveAnimation.value,
            child: Image.asset(
              'assets/images/dash_bird_super.png',
              width: 200,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }

  // Animation<Offset> _getAnimation(
  //   AnimationController controller,
  //   double begin,
  //   double end,
  // ) {
  //   return Tween<Offset>(
  //     begin: const Offset(-1000, 0),
  //     end: Offset.zero,
  //   ).animate(
  //     CurvedAnimation(
  //       parent: controller,
  //       curve: Interval(
  //         begin,
  //         end,
  //         curve: Curves.fastLinearToSlowEaseIn,
  //       ),
  //     ),
  //   );
  // }
}
