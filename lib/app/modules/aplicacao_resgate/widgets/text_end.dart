import 'package:byebank/app/modules/aplicacao_resgate/controller.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextendWidget extends Container {
  final controller = Get.find<AplicacaoResgateController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        com_a_bb,
        style: TextStyle(
          color: this.controller.config!.getTheme() ? whiteColor : blackColor,
        ),
      ),
    );
  }
}
