import 'package:animation_playground/constants/sample_page.dart';
import 'package:animation_playground/widgets/base_button.dart';
import 'package:animation_playground/widgets/code_button.dart';
import 'package:animation_playground/widgets/github_button.dart';
import 'package:flutter/material.dart';

class ControlContainer extends StatefulWidget {
  const ControlContainer({
    super.key,
    required this.controller,
    required this.sample,
  });

  final AnimationController controller;
  final SamplePage sample;

  @override
  State<ControlContainer> createState() => _ControlContainerState();
}

class _ControlContainerState extends State<ControlContainer> {
  bool hasAppeared = false;
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.sample.subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CodeButton(
                    path: widget.sample.codePath,
                  ),
                  const SizedBox(width: 24),
                  GithubButton(
                    url: widget.sample.url,
                  ),
                  const SizedBox(width: 24),
                  BaseButton(
                    onPressed: !isProcessing
                        ? () => _onPressed(widget.controller)
                        : null,
                    text: !hasAppeared ? 'START' : 'REVERSE',
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed(
    AnimationController controller,
  ) async {
    setState(() => isProcessing = true);
    if (controller.status == AnimationStatus.completed) {
      await controller.reverse();
      setState(() => hasAppeared = false);
    } else {
      await controller.forward();
      setState(() => hasAppeared = true);
    }
    setState(() => isProcessing = false);
  }
}
