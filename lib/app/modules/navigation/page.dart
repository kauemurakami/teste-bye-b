import 'package:byebank/app/modules/navigation/controller.dart';
import 'package:byebank/app/modules/navigation/widgets/bottom_navigation.dart';
import 'package:byebank/app/modules/navigation/widgets/float_button.dart';
import 'package:byebank/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.MOVIMENTACOES_SALDO,
          onGenerateRoute: this.controller.onGenerateRoute,
        ),
        floatingActionButton: CustomFloatingButtonMenuWidget(),
        bottomNavigationBar: CustomBottomNavigationwidget());
  }
}
