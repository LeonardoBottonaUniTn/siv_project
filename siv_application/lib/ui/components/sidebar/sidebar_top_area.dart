import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarTopArea extends StatelessWidget {
  final EdgeInsets padding;
  final Function onCollapseChanged;

  const SidebarTopArea({
    key,
    required this.padding,
    required this.onCollapseChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
