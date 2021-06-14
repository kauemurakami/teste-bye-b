import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/core/theme/text_theme.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends Container {
  final controller = Get.find<MovimentacoesSaldoController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          ' Olá ' +
              this
                  .controller
                  .auth!
                  .user
                  .value
                  .username!
                  .split('@')[0]
                  .toUpperCase() +
              '!',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color:
                  this.controller.config!.getTheme() ? whiteColor : blackColor),
        ),
      ],
    );
  }
}
