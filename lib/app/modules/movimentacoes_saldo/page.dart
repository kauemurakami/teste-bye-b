import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/widgets/loading.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacoesSaldoPage extends GetView<MovimentacoesSaldoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this.controller.obx(
            (state) => SafeArea(
                    child: Column(
                  children: [
                    Text('MovimentacoessaldoController'),
                  ],
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
                            ))
                      ],
                    ),
                  ),
                ),
            onLoading: Center(child: CustomLoadingWidget())));
  }
}
