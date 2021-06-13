import 'package:byebank/app/data/services/auth/service.dart';
import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/app/widgets/custom_snack_widget.dart';
import 'package:byebank/core/utils/get_errors.dart';
import 'package:byebank/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginController extends GetxController {
  AuthService? auth;
  AppConfigService? config;

  final isEmail = false.obs;
  final obscure = true.obs;

  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    this.config = Get.find<AppConfigService>();
    super.onInit();
  }

  login() async {
    var data = await this
        .auth
        ?.login(this.auth?.user.value.username, this.auth?.user.value.senha);
    if (data == null) {
      showTopSnackBar(
          Get.overlayContext!,
          CustomSnackBarWidget(
              'Erro inesperado', Icons.sentiment_dissatisfied_outlined));
    }
    if (VerifyError.verify(data)) {
      showTopSnackBar(
          Get.overlayContext!,
          CustomSnackBarWidget(
              data.errors, Icons.sentiment_dissatisfied_outlined));
    } else {
      Get.toNamed(Routes.MOVIMENTACOES_SALDO);
    }
  }

  showPass() => this.obscure.value = !this.obscure.value;
  changeEmail(v) {
    if (GetUtils.isEmail(v)) {
      this.auth?.user.update((user) => user?.username = v);
      this.isEmail.value = true;
    } else {
      this.isEmail.value = false;
    }
  }

  validateEmail(v) => GetUtils.isEmail(v) ? null : 'Insira um e-mail válido.';
  savedEmail(v) => this.auth?.user.update((user) => user?.username = v);

  changeSenha(v) {
    if (v.length > 3) {
      this.auth?.user.update((user) => user?.senha = v);
    } else {}
  }

  validateSenha(v) => v.length > 3 ? null : 'Insira um e-mail válido.';
  savedSenha(v) => this.auth?.user.update((user) => user?.senha = v);
}
