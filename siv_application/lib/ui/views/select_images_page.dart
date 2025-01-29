import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siv_application/ui/getX/get_selected_images.dart';

class SelectImagesPage extends StatelessWidget {
  final VoidCallback nextPage;
  SelectImagesPage({super.key, required this.nextPage});

  //get images from assets/images folder
  final List<String> images = [
    'assets/images/IMG_001.JPG',
    'assets/images/IMG_002.JPG',
    'assets/images/IMG_003.JPG',
    'assets/images/IMG_004.JPG',
    'assets/images/IMG_005.JPG',
  ];

  final imageSelectedController = Get.put(GetSelectedImages());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Images'),
      ),
      body: GridView.builder(
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
              return GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: imageSelectedController.selectedImages
                            .contains(images[index])
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: Color(0xFF666F77),
                          ),
                  ),
                  child: Image.asset(images[index]));
            }),
          );
        },
      ),
      floatingActionButton: Obx(() {
        return Visibility(
          visible: imageSelectedController.selectedImages.isNotEmpty,
          child: FloatingActionButton.extended(
              onPressed: nextPage,
              label: Text(
                  'Next (${imageSelectedController.selectedImages.length})')),
        );
      }),
    );
  }
}
