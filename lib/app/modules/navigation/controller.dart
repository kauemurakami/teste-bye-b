import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/app/modules/aplicacao_resgate/binding.dart';
import 'package:byebank/app/modules/aplicacao_resgate/page.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/binding.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/page.dart';
import 'package:byebank/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController
    with SingleGetTickerProviderMixin {
  AppConfigService? config;
  Animation<double>? animation;
  AnimationController? animationController;
  CurvedAnimation? curvedAnimation;

  @override
  void onInit() {
    this.animationController = animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    this.curvedAnimation = CurvedAnimation(
        curve: Curves.easeInOut, parent: this.animationController!);
    this.animation =
        Tween<double>(begin: 0, end: 1).animate(this.curvedAnimation!);
    this.config = Get.find<AppConfigService>();
    super.onInit();
  }

  final pages = <String>[
    Routes.MOVIMENTACOES_SALDO,
    Routes.APLICACAO_RESGATE,
  ];
  final index = 0.obs;
  changePage(index) {
    this.index.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  ScrollController sController = ScrollController();
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.MOVIMENTACOES_SALDO) {
      return GetPageRoute(
          settings: settings,
          page: () => MovimentacoesSaldoPage(),
          binding: MovimentacoesSaldoBinding());
    }
    if (settings.name == Routes.APLICACAO_RESGATE) {
      return GetPageRoute(
          settings: settings,
          page: () => AplicacaoResgatePage(),
          binding: AplicacaoResgateBinding());
    }
    return null;
  }
}
