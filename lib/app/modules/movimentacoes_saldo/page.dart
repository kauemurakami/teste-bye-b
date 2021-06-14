import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/card_saldo.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/header.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/list_movimentacoes.dart';
import 'package:byebank/app/widgets/loading.dart';
import 'package:byebank/core/theme/text_theme.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacoesSaldoPage extends GetView<MovimentacoesSaldoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            this.controller.config!.getTheme() ? blackColor : whiteColor,
        body: this.controller.obx(
            (state) => SafeArea(
                    child: Container(
                  margin: EdgeInsets.only(left: 24.0, top: 24.0),
                  child: Column(
                    children: [
                      HeaderWidget(),
                      CardSaldoWidget(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          movimentacoes,
                          style: title,
                        ),
                      ),
                      CustomListMovimentacoesWidget()
                    ],
                  ),
                )),
            onError: (err) => Container(
                  height: SizeConfig.hp(100.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(err!),
                        IconButton(
                            onPressed: () => this.controller.getMovimentacoes(),
                            icon: Icon(
                              Icons.replay_outlined,
                              color: this.controller.config!.getTheme()
                                  ? whiteColor
                                  : blackColor,
                              size: 32.0,
                            ))
                      ],
                    ),
                  ),
                ),
            onLoading: Center(child: CustomLoadingWidget())));
  }
}
