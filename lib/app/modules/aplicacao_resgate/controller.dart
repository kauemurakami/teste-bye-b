import 'package:byebank/app/data/services/auth/service.dart';
import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/app/modules/aplicacao_resgate/repository.dart';
import 'package:byebank/app/widgets/custom_snack_widget.dart';
import 'package:byebank/core/utils/get_errors.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AplicacaoResgateController extends GetxController {
  final AplicacaoResgateRepository repository;
  AplicacaoResgateController(this.repository);
  AuthService? auth;
  AppConfigService? config;
  final movimentacao = 0.0.obs;
  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    this.config = Get.find<AppConfigService>();
    super.onInit();
  }

  onChangeAplicacao(v) {
    if (v.length >= 1) this.movimentacao.value = double.parse(v);
  }

  movimentacaofun({tipo}) async {
    if (tipo == APLICACAO) {
      this.auth!.saldo.value += this.movimentacao.value;
    } else {
      if (movimentacao.value > this.auth!.saldo.value) {
        showTopSnackBar(
            Get.overlayContext!,
            CustomSnackBarWidget(
                'Você não possui saldo o suficiente para resgatar este valor.',
                Icons.sentiment_neutral_outlined));
      } else {
        this.auth!.saldo.value -= this.movimentacao.value;
      }
    }
    if (this.movimentacao.value < 2.0) {
      showTopSnackBar(
          Get.overlayContext!,
          CustomSnackBarWidget(
              min_aplicacao, Icons.sentiment_neutral_outlined));
    } else {
      var data =
          await this.repository.movimentacao(tipo, this.movimentacao.value);
      if (data == null) {
        showTopSnackBar(
            Get.overlayContext!,
            CustomSnackBarWidget(
                error_inesp, Icons.sentiment_dissatisfied_outlined));
      }
      if (VerifyError.verify(data)) {
        showTopSnackBar(
            Get.overlayContext!,
            CustomSnackBarWidget(
                data.errors, Icons.sentiment_dissatisfied_outlined));
      } else {
        if (tipo == APLICACAO) {
          showTopSnackBar(
              Get.overlayContext!,
              CustomSnackBarWidget(
                  'Valor de R\$ ${this.movimentacao.value} aplicados!',
                  Icons.sentiment_satisfied_outlined));
        } else {
          if (movimentacao.value < this.auth!.saldo.value) {
            showTopSnackBar(
                Get.overlayContext!,
                CustomSnackBarWidget(
                    'Valor de R\$ ${this.movimentacao.value} foi resgatados!',
                    Icons.sentiment_satisfied_outlined));
          }
        }
      }
    }
  }
}
