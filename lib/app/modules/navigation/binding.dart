import 'package:byebank/app/modules/navigation/controller.dart';
import 'package:get/get.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
