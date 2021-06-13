import 'package:byebank/app/modules/movimentacoes_saldo/controller.dart';
import 'package:byebank/app/widgets/loading.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacoesSaldoPage extends GetView<MovimentacoesSaldoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this.controller.obx(
            (state) => SafeArea(
                    child: Container(
                  margin: EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(saldo),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                (BorderRadius.all(Radius.circular(12.0)))),
                        height: SizeConfig.hp(14.0),
                        width: SizeConfig.wp(100.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' R\$ 200,00',
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(movimentacoes),
                      Expanded(
                          child: ListView.builder(
                              itemCount: state?.value.movimentacoes?.length,
                              itemBuilder: (_, index) => Container(
                                    child: Text(
                                        '${state?.value.movimentacoes?[0].tipo}'),
                                  ))),
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
