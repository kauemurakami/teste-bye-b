import 'package:byebank/app/data/providers/api.dart';
import 'package:byebank/app/modules/aplicacao_resgate/controller.dart';
import 'package:byebank/app/modules/aplicacao_resgate/repository.dart';
import 'package:get/get.dart';

class AplicacaoResgateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AplicacaoResgateController>(
        () => AplicacaoResgateController(AplicacaoResgateRepository(MyApi())));
  }
}
