import 'package:byebank/app/data/providers/api.dart';
import 'package:byebank/app/modules/login/controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
