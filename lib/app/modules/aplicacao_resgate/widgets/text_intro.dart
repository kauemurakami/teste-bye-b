import 'package:byebank/app/modules/aplicacao_resgate/controller.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextIntroWidget extends Container {
  final controller = Get.find<AplicacaoResgateController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Escolha o que fazer com seu dinheiro.',
        style: TextStyle(
            color: this.controller.config!.getTheme() ? whiteColor : blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.0),
      ),
    );
  }
}
