import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    bool? showScrollBar,
    this.headerPadding,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.bodyPadding,
    this.contentPadding,
    required this.body,
  }) : showScrollBar = showScrollBar ?? false;

  final bool showScrollBar;
  final EdgeInsetsGeometry? headerPadding;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? bodyPadding;
  final EdgeInsetsGeometry? contentPadding;
  final Widget body;

  static Future<T?> show<T>(
    BuildContext context, {
    bool? showScrollBar,
    EdgeInsetsGeometry? headerPadding,
    Widget? leading,
    required Widget title,
    Widget? subtitle,
    Widget? trailing,
    EdgeInsetsGeometry? bodyPadding,
    EdgeInsetsGeometry? contentPadding,
    required Widget body,
  }) =>
      showModalBottomSheet(
        context: context,
        enableDrag: true,
        showDragHandle: true,
        builder: (context) => AppBottomSheet(
          showScrollBar: showScrollBar,
          headerPadding: headerPadding,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          bodyPadding: bodyPadding,
          contentPadding: contentPadding,
          body: body,
        ),
      );

  @override
  Widget build(BuildContext context) {
    TextStyle? titleTextStyle = context.textTheme.headlineLarge;

    Widget child = body;
    if (bodyPadding != null) {
      child = Padding(padding: bodyPadding!, child: body);
    }

    if (body is BoxScrollView && showScrollBar) {
      child = Scrollbar(
        interactive: true,
        thumbVisibility: true,
        child: child,
      );
    }

    if (contentPadding != null) {
      child = Padding(padding: contentPadding!, child: child);
    }

    return SafeArea(
      child: Column(
        children: [
          ListTile(
            contentPadding: headerPadding,
            leading: leading,
            title: ConditionalWrapper(
              condition: titleTextStyle != null,
              wrapper: (child) => DefaultTextStyle(
                style: titleTextStyle!,
                child: child,
              ),
              child: title,
            ),
            subtitle: subtitle,
            trailing: trailing,
          ),
          const SizedBox(height: 8),
          const Divider(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
