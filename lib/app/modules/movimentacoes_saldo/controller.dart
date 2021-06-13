import 'package:byebank/app/data/models/movimentacoes.dart';
import 'package:byebank/app/data/services/auth/service.dart';
import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/repository.dart';
import 'package:get/get.dart';

class MovimentacoesSaldoController extends GetxController
    with StateMixin<Rx<Movimentacoes>> {
  final MovimentacoesSaldoRepository repository;
  MovimentacoesSaldoController(this.repository);
  final movimentacoes = Movimentacoes().obs;
  AuthService? auth;
  AppConfigService? config;
  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    this.config = Get.find<AppConfigService>();
    this.repository.getMovimentacoes().then((state) {
      change(state, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error('Erro ao recuperar Movimentações/Saldo'),
      );
      super.onInit();
    });
  }

  getMovimentacoes() async {
    print(this.auth?.token.value);
    await this.repository.getMovimentacoes().then((state) {
      change(state, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error('Erro ao recuperar Movimentações/Saldo'),
      );
    });
  }
}
