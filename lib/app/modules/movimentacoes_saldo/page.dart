import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/card_movimentacoes.dart';
import 'package:byebank/app/modules/movimentacoes_saldo/widgets/card_saldo.dart';
import 'package:byebank/app/modules/navigation/controller.dart';
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
                      Text(
                        saldo,
                        style: title,
                      ),
                      CardSaldoWidget(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movimentacoes,
                          style: title,
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              controller:
                                  Get.find<NavigationController>().sController,
                              itemCount: state?.value.movimentacoes?.length,
                              itemBuilder: (_, index) =>
                                  CardMovimentacoeswidget(index))),
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
