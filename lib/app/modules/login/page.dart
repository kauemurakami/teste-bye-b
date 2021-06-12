import 'package:byebank/app/modules/login/controller.dart';
import 'package:byebank/app/widgets/custom_button.dart';
import 'package:byebank/app/widgets/custom_tff.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor:
            this.controller.config!.getTheme() ? blackColor : whiteColor,
        body: SafeArea(
            child: Column(
          children: [
            Text('Login'),
            Container(
              height: SizeConfig.hp(16.0),
              width: SizeConfig.wp(32.0),
              child: Image(
                  image: AssetImage(this.controller.config!.getTheme()
                      ? '${IMAGES_PATH}darkmode.jpg'
                      : '${IMAGES_PATH}ligthmode.jpg')),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: this._formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: CustomTffWidget(
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
                                onChanged: (v) =>
                                    this.controller.changeSenha(v),
                                onValidate: (v) =>
                                    this.controller.validateSenha(v),
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              width: SizeConfig.wp(30.0),
              child: CustomButtonWidget(
                () async {
                  await this.controller.login();
                },
                entrar,
                this.controller.config!.getTheme() ? whiteColor : blackColor,
              ),
            )
          ],
        )));
  }
}
