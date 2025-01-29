import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:siv_application/ui/getX/get_selected_images.dart';

class FirstTaskController extends GetxController {
  final taskCompleted = GetSelectedImages().selectedImages.isNotEmpty.obs;

  void completeTask() {
    taskCompleted.value = true;
    print(taskCompleted.value);
  }
}
