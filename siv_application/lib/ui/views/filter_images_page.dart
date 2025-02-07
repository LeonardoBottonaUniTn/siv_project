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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              final images = imageSelectedController.selectedImages;
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return GridTile(child: Image.asset(images[index]));
                  });
                },
              );
            }),
            const SizedBox(height: 20),
            const Text(
              'Select filter to apply',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Filter 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Filter 2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Filter 3'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Next'),
      ),
    );
  }
}
