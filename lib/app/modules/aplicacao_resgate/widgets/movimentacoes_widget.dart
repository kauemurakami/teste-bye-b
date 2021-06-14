import 'package:byebank/app/modules/aplicacao_resgate/controller.dart';
import 'package:byebank/app/widgets/custom_button.dart';
import 'package:byebank/app/widgets/custom_tf.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacoesWidget extends Container {
  final controller = Get.find<AplicacaoResgateController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: SizeConfig.hp(10.0),
              width: SizeConfig.wp(100.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTfWidget(
                      type: TextInputType.number,
                      text: valor,
                      onChanged: (v) => this.controller.onChangeAplicacao(v),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.green,
                        size: 32.0,
                      )),
                  Expanded(
                      flex: 5,
                      child: CustomButtonWidget(
                        callback: () =>
                            this.controller.movimentacaofun(tipo: APLICACAO),
                        text: aplicar,
                        color: this.controller.config!.getTheme()
                            ? whiteColor
                            : blackColor,
                      ))
                ],
              )),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomTfWidget(
                  type: TextInputType.number,
                  text: valor,
                  onChanged: (v) => this.controller.onChangeAplicacao(v),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Icon(
                    Icons.arrow_left_sharp,
                    color: redColor,
                    size: 32.0,
                  )),
              Expanded(
                  flex: 5,
                  child: CustomButtonWidget(
                    callback: () {
                      this.controller.movimentacaofun(tipo: RESGATE);
                    },
                    text: resgatar,
                    color: this.controller.config!.getTheme()
                        ? whiteColor
                        : blackColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
