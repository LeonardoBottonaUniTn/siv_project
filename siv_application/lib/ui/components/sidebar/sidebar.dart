import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siv_application/ui/components/sidebar/navigation/navigation_bar_item.dart';
import 'package:siv_application/ui/components/sidebar/navigation/navigation_bar.dart';
import 'package:siv_application/ui/components/sidebar/sidebar_top_area.dart';
import 'package:siv_application/ui/getX/tasks/fist_task_controller.dart';
import 'package:siv_application/ui/view_model/navigation_item.dart';

class Sidebar extends StatefulWidget {
  final double width;
  final Function(int page) onSelectPage;

  // ignore: use_super_parameters
  const Sidebar({
    key,
    required this.width,
    required this.onSelectPage,
  }) : super(key: key);

  @override
  SidebarState createState() => SidebarState();
}

class SidebarState extends State<Sidebar> {
  int _currentIndex = 0;

  final firstTaskController = Get.put(FirstTaskController());

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
              FirstTaskBarItem(
                label: _navigation[0].label,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                    firstTaskController.completeTask();
                    widget.onSelectPage(_currentIndex);
                  });
                },
              ),
              NavigationBarItem(
                label: _navigation[1].label,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                    widget.onSelectPage(_currentIndex);
                  });
                },
                isCompleted: _navigation[1].completed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
