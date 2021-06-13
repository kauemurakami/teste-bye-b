import 'package:byebank/app/data/providers/api.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/repository.dart';
import 'package:get/get.dart';

class MovimentacoesSaldoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovimentacoesSaldoController>(() =>
        MovimentacoesSaldoController(MovimentacoesSaldoRepository(MyApi())));
  }
}
