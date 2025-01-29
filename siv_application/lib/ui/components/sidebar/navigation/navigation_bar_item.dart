import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class NavigationBarItem extends StatelessWidget {
  final String? label;
  final EdgeInsets padding;
  final GestureTapCallback? onTap;
  final bool isCompleted;

  NavigationBarItem({
    key,
    required this.label,
    required this.padding,
    required this.onTap,
    required this.isCompleted,
  }) : super(key: key);

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
