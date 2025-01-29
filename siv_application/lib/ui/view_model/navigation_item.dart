import 'package:flutter/widgets.dart';

class NavigationItem {
  final String label;
  final bool completed;
  final Function? onTap;

  NavigationItem({
    required this.label,
    this.onTap,
    this.completed = false,
  });
}
