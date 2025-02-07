import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:siv_application/ui/getX/tasks/fist_task_controller.dart';

class NavigationBarItem extends StatelessWidget {
  final String? label;
  final EdgeInsets padding;
  final GestureTapCallback? onTap;
  final bool isCompleted;

  const NavigationBarItem({
    super.key,
    required this.label,
    required this.padding,
    required this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {},
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                        label!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    isCompleted
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: Color(0xFF666F77),
                          ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: isCompleted,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                      width: 2,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstTaskBarItem extends NavigationBarItem {
  FirstTaskBarItem({
    required String label,
    required EdgeInsets padding,
    required GestureTapCallback onTap,
  }) : super(
          label: label,
          padding: padding,
          onTap: onTap,
        );

  final controller = Get.put(FirstTaskController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {},
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: padding,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          label!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      controller.taskCompleted.value
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                              color: Color(0xFF666F77),
                            ),
                    ],
                  );
                }),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: controller.taskCompleted.value,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                      width: 2,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
