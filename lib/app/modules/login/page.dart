import 'package:byebank/app/modules/login/controller.dart';
import 'package:byebank/app/modules/login/widgets/image_stack.dart';
import 'package:byebank/app/modules/login/widgets/login_form.dart';
import 'package:byebank/app/widgets/button_theme.dart';
import 'package:byebank/app/widgets/custom_button.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:byebank/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:
            this.controller.config!.getTheme() ? blackColor : whiteColor,
        body: SafeArea(
            child: Stack(
          children: [
            ButtonChangeThemewidget(),
            Container(
              height: SizeConfig.hp(100.0),
              width: SizeConfig.wp(100.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 32.0),
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
                      key: _formKey,
                      child: Column(
                        children: [
                          LoginFormWidget(),
                          Container(
                            margin: EdgeInsets.only(top: 24.0),
                            width: SizeConfig.wp(30.0),
                            child: CustomButtonWidget(
                              callback: () async {
                                final FormState form = _formKey.currentState!;
                                if (form.validate()) {
                                  form.save();
                                  await this.controller.login();
                                }
                              },
                              text: entrar,
                              color: this.controller.config!.getTheme()
                                  ? whiteColor
                                  : blackColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ImageLoginStakWidget()
          ],
        )));
  }
}
