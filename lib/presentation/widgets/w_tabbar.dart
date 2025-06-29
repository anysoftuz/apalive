import 'package:apalive/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;
  final bool? isScrollable;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? labelColor;

  const WTabBar({
    this.tabController,
    required this.tabs,
    super.key,
    this.onTap,
    this.padding,
    this.isScrollable,
    this.color,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFF4F4F4),
      ),
      height: 48,
      child: TabBar(
        dividerColor: Colors.transparent,
        tabAlignment: isScrollable == true ? TabAlignment.start : null,
        padding: padding ?? const EdgeInsets.all(4),
        labelPadding: const EdgeInsets.symmetric(horizontal: 24),
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
        isScrollable: isScrollable ?? false,
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 3),
              color: black.withValues(alpha: 0.04),
            ),
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: black.withValues(alpha: 0.12),
            ),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: black.withValues(alpha: 0.04)),
            borderRadius: BorderRadius.circular(12),
          ),
          color: color ?? white,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelStyle: Theme.of(context).textTheme.displayLarge!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: Color(0xFF667085),
        labelColor: labelColor ?? textPrimary900,

        tabs: tabs,
      ),
    );
  }
}
