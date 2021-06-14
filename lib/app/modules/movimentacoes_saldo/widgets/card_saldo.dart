import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSaldoWidget extends Container {
  final controller = Get.find<MovimentacoesSaldoController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: 16.0, left: 16.0),
          margin: EdgeInsets.only(top: 8.0, bottom: 16.0, right: 24.0),
          decoration: BoxDecoration(
              color:
                  this.controller.config!.getTheme() ? whiteColor : blackColor,
              borderRadius: (BorderRadius.all(Radius.circular(12.0)))),
          height: SizeConfig.hp(14.0),
          width: SizeConfig.wp(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => !this.controller.viewSaldo.value
                      ? Container(
                          color: this.controller.config!.getTheme()
                              ? blackColor
                              : whiteColor,
                          height: SizeConfig.hp(5.0),
                          width: SizeConfig.wp(50.0),
                        )
                      : Text(
                          ' R\$ ${this.controller.saldo.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 32.0,
                              color: this.controller.config!.getTheme()
                                  ? blackColor
                                  : whiteColor,
                              fontWeight: FontWeight.w600),
                        )),
                  IconButton(
                      padding: EdgeInsets.only(right: 8.0),
                      onPressed: () => this.controller.showSaldo(),
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 40.0,
                        color: this.controller.config!.getTheme()
                            ? blackColor
                            : whiteColor,
                      ))
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 24.0,
          bottom: 24.0,
          child: Text(
            '$rendimentos + R\$ 32,20',
            style: TextStyle(
                color: this.controller.config!.getTheme()
                    ? Colors.green
                    : Colors.greenAccent,
                fontSize: 12.0),
          ),
        ),
        Positioned(
          left: 24.0,
          top: 16.0,
          child: Text(
            saldo,
            style: TextStyle(
                color: this.controller.config!.getTheme()
                    ? blackColor
                    : whiteColor,
                fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
