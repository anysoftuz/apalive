import 'package:apalive/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.child, required this.bottom});

  final Widget child;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.fromLTRB(0, 12, 0, bottom > 0 ? 12 : 32),
      decoration: BoxDecoration(color: white, boxShadow: wboxShadow),
      child: child,
    );
  }
}
