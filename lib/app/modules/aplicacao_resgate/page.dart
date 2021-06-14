import 'package:byebank/app/modules/aplicacao_resgate/controller.dart';
import 'package:byebank/app/modules/aplicacao_resgate/widgets/movimentacoes_widget.dart';
import 'package:byebank/app/modules/aplicacao_resgate/widgets/stack_money_img.dart';
import 'package:byebank/app/modules/aplicacao_resgate/widgets/text_intro.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AplicacaoResgatePage extends GetView<AplicacaoResgateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            this.controller.config!.getTheme() ? blackColor : whiteColor,
        body: Stack(
          children: [
            SafeArea(
                child: Container(
              margin: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        '${this.controller.auth!.user.value.username!.split('@')[0].toUpperCase()} seu saldo é de R\$${this.controller.auth!.saldo.value.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: this.controller.config!.getTheme()
                                ? whiteColor
                                : blackColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      )),
                  TextIntroWidget(),
                  MovimentacoesWidget(),
                ],
              ),
            )),
            StackImageMoneyWidget()
          ],
        ));
  }
}
