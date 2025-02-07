import 'package:flutter/widgets.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  final List<Widget> children;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}
