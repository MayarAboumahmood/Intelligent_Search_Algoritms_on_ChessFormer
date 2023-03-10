import 'package:get/get.dart';
import 'play_controller.dart';

class UiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlayController());
  }
}
