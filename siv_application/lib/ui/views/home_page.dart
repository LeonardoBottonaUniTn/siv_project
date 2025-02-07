import 'package:flutter/material.dart';
import 'package:siv_application/ui/components/sidebar/sidebar.dart';
import 'package:siv_application/ui/getX/tasks/fist_task_controller.dart';
import 'package:siv_application/ui/views/filter_images_page.dart';
import 'package:siv_application/ui/views/select_images_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 200,
              right: 0,
              bottom: 0,
              child: PageView(
                controller: _pageController,
                children: [
                  SelectImagesPage(
                    nextPage: () {
                      FirstTaskController().completeTask();
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                  ),
                  FilterImagesPage()
                ],
              ),
            ),
            Positioned(
              left: 200,
              top: 0,
              right: 0,
              child: Align(
                  child: AppBar(
                title: const Text(
                  'Siv Project Demo',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
              )),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Sidebar(
                width: 200,
                onSelectPage: (page) {
                  _pageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
