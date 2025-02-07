import 'package:get/get.dart';

class FirstTaskController extends GetxController {
  final RxBool taskCompleted = false.obs;

  void completeTask() {
    taskCompleted.value = true;
  }
}
