import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siv_application/ui/getX/get_selected_images.dart';

class FilterImagesPage extends StatelessWidget {
  FilterImagesPage({super.key});

  //get images from assets/images folder

  final imageSelectedController = Get.put(GetSelectedImages());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Images'),
      ),
      body: Obx(() {
        final images = imageSelectedController.selectedImages;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                imageSelectedController.selectImage(images[index]);
              },
              child: Obx(() {
                return GridTile(child: Image.asset(images[index]));
              }),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Next'),
      ),
    );
  }
}
