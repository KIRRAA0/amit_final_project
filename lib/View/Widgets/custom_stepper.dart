import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int stepIndex;
  final int currentStep;
  final bool isCompleted;

  const CustomStepper({
    super.key,
    required this.stepIndex,
    required this.currentStep,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    Color determineColor() {
      if (isCompleted) {
        return Colors.blue;
      } else if (stepIndex > currentStep) {
        return Colors.grey;
      } else {
        return Colors.blue;
      }
    }
    Color determineFillColor() {
      if (isCompleted) {
        return Colors.blue;
      } else if (stepIndex < currentStep) {
        return Colors.grey;
      } else {
        return Colors.transparent;
      }
    }

    Widget determineChild() {
      if (isCompleted) {
        return const Icon(Icons.check, color: Colors.white, size: 30);
      } else if (stepIndex < currentStep) {
        return Text(
          (stepIndex + 1).toString(),
          style: const TextStyle(color: Colors.white),
        );
      } else {
        return Text(
          (stepIndex + 1).toString(),
          style: TextStyle(color: determineColor(),fontSize: 24),
        );
      }
    }

    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: determineFillColor(),
        shape: BoxShape.circle,
        border: Border.all(
          color: determineColor(),
        ),
      ),
      child: Center(child: determineChild()),
    );
  }
}
