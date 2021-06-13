import 'package:byebank/app/data/models/movimentacoes.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardMovimentacoeswidget extends Container {
  final controller = Get.find<MovimentacoesSaldoController>();
  final index;
  CardMovimentacoeswidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 24.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0))),
      height: SizeConfig.hp(12.0),
      width: SizeConfig.wp(100.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${this.controller.state!.value.movimentacoes![index].tipo}',
                style: TextStyle(
                    color: this
                                .controller
                                .state!
                                .value
                                .movimentacoes![index]
                                .tipo ==
                            APLICACAO
                        ? Colors.green
                        : redColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              Text(
                '${this.controller.state!.value.movimentacoes![index].data!.day}/${this.controller.state!.value.movimentacoes![index].data!.month}/${this.controller.state!.value.movimentacoes![index].data!.year} ás  ${this.controller.state!.value.movimentacoes![index].data!.hour}${this.controller.state!.value.movimentacoes![index].data!.hour}:${this.controller.state!.value.movimentacoes![index].data!.minute}${this.controller.state!.value.movimentacoes![index].data!.minute}',
                style: TextStyle(
                  color: this.controller.config!.getTheme()
                      ? whiteColor
                      : blackColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'R\$ ${this.controller.state!.value.movimentacoes![index].valor}',
              style: TextStyle(
                  color:
                      this.controller.state!.value.movimentacoes![index].tipo ==
                              APLICACAO
                          ? Colors.green
                          : redColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
