import 'package:flutter/widgets.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  final List<Widget> children;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}
