import 'package:flutter/material.dart';

class BootstrapHelper {
  static const int columns = 12;
  
  static double getWidth(BuildContext context, int size) {
    return MediaQuery.of(context).size.width * (size / columns);
  }
}

class BootstrapContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool fluid;

  const BootstrapContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.fluid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fluid ? double.infinity : 1140.0,
      padding: padding,
      child: child,
    );
  }
}

class BootstrapRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const BootstrapRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}

class BootstrapCol extends StatelessWidget {
  final Widget child;
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;

  const BootstrapCol({
    super.key,
    required this.child,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int size;

    if (width >= 1200 && lg != null) {
      size = lg!;
    } else if (width >= 992 && md != null) {
      size = md!;
    } else if (width >= 768 && sm != null) {
      size = sm!;
    } else {
      size = xs;
    }

    return SizedBox(
      width: BootstrapHelper.getWidth(context, size),
      child: child,
    );
  }
} 