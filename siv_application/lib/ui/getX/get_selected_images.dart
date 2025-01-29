import 'package:get/get.dart';

class GetSelectedImages extends GetxController {
  //store selected images
  final List selectedImages = [].obs;

  void selectImage(String image) {
    if (selectedImages.contains(image)) {
      selectedImages.remove(image);
    } else {
      selectedImages.add(image);
    }
  }
}
