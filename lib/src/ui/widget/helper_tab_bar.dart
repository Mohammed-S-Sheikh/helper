import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';

class HelperTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HelperTabBar({
    super.key,
    required this.tabs,
    this.onTap,
    this.controller,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedlabelColor,
    this.preferredSizeHeight = kToolbarHeight,
  });

  final List<String> tabs;
  final ValueChanged<int>? onTap;
  final TabController? controller;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedlabelColor;
  final double preferredSizeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        onTap: onTap,
        controller: controller,
        dividerColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(6),
        indicator: BoxDecoration(
          color: indicatorColor ?? context.colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        unselectedLabelColor: unselectedlabelColor,
        labelColor: labelColor ?? context.colorScheme.onPrimary,
        tabs: [for (final tab in tabs) Tab(text: tab)],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeHeight);
}
