import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/card_movimentacoes.dart';
import 'package:byebank/app/modules/navigation/controller.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListMovimentacoesWidget extends Container {
  final controller = Get.find<MovimentacoesSaldoController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: blackColor,
        onRefresh: () => this.controller.getMovimentacoes(),
        child: ListView.builder(
            controller: Get.find<NavigationController>().sController,
            itemCount: this.controller.state?.value.movimentacoes?.length,
            itemBuilder: (_, index) => CardMovimentacoeswidget(index)),
      ),
    );
  }
}
