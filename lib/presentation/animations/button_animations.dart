import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';

class ButtonAnimations {
  static Widget floatingButton({
    required AnimationController controller,
    required Widget child,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, 2 * sin(controller.value * 2 * pi)),
          child: child,
        );
      },
    );
  }
  
  static Widget pulseButton({
    required Widget child,
  }) {
    return child.animate()
      .fade(duration: 500.ms)
      .scale(duration: 700.ms)
      .shimmer(duration: 1000.ms);
  }
} 