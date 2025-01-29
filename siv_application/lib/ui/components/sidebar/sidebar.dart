import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siv_application/ui/components/sidebar/navigation/navigation_bar_item.dart';
import 'package:siv_application/ui/components/sidebar/navigation/navigation_bar.dart';
import 'package:siv_application/ui/components/sidebar/sidebar_top_area.dart';
import 'package:siv_application/ui/getX/tasks/fist_task_controller.dart';
import 'package:siv_application/ui/view_model/navigation_item.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Sidebar extends StatefulWidget {
  final double width;
  final Function(int page) onSelectPage;

  const Sidebar({
    key,
    required this.width,
    required this.onSelectPage,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _currentIndex = 0;

  FirstTaskController firstTaskController = Get.put(FirstTaskController());

  late List<NavigationItem> _navigation;

  @override
  void initState() {
    super.initState();
    _navigation = [
      NavigationItem(
        completed: firstTaskController.taskCompleted.value,
        label: 'Seleziona immagini',
      ),
      NavigationItem(
        completed: false,
        label: 'Immagini',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF303841),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      width: widget.width,
      child: ListView(
        children: [
          SidebarTopArea(
            padding: const EdgeInsets.all(15),
            onCollapseChanged: () {},
          ),
          const SizedBox(
            height: 35,
          ),
          CustomNavBar(
            selectedIndex: _currentIndex,
            children: [
              for (int i = 0; i < _navigation.length; i++)
                NavigationBarItem(
                  isCompleted: _navigation[i].completed,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  label: _navigation[i].label,
                  onTap: () {
                    setState(() {
                      _currentIndex = i;
                      widget.onSelectPage(i);
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
