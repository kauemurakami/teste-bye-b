import 'package:byebank/app/modules/login/binding.dart';
import 'package:byebank/app/modules/login/page.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/binding.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    // GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: Routes.MOVIMENTACOES_SALDO,
        page: () => MovimentacoesSaldoPage(),
        binding: MovimentacoesSaldoBinding()),
  ];
}
