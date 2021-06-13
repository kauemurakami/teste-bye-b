import 'package:byebank/app/modules/login/controller.dart';
import 'package:byebank/app/widgets/custom_tff.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends Container {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 10,
              child: CustomTffWidget(
                type: TextInputType.emailAddress,
                text: email,
                onChanged: (v) => this.controller.changeEmail(v),
                onValidate: (v) => this.controller.validateEmail(v),
                onSaved: (v) => this.controller.savedEmail(v),
              ),
            ),
            Expanded(
              flex: 2,
              child: Obx(() => Icon(
                    Icons.check,
                    color: this.controller.isEmail.value
                        ? Colors.green
                        : Colors.grey,
                  )),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 10,
              child: Obx(() => CustomTffWidget(
                    obscure: this.controller.obscure.value,
                    text: senha,
                    onChanged: (v) => this.controller.changeSenha(v),
                    onValidate: (v) => this.controller.validateSenha(v),
                    onSaved: (v) => this.controller.savedSenha(v),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Obx(() => IconButton(
                  onPressed: () => this.controller.showPass(),
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this.controller.obscure.value
                        ? Colors.grey
                        : Colors.green,
                  ))),
            )
          ],
        ),
      ],
    );
  }
}
