import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarTopArea extends StatelessWidget {
  final EdgeInsets padding;
  final Function onCollapseChanged;

  const SidebarTopArea({
    super.key,
    required this.padding,
    required this.onCollapseChanged,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
