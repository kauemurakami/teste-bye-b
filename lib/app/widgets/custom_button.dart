import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonWidget extends Container {
  final config = Get.find<AppConfigService>();
  final text, color, callback;
  CustomButtonWidget(this.callback, this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style:
            TextStyle(color: this.config.getTheme() ? whiteColor : blackColor),
      ),
      onPressed: () => this.callback(),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: this.color!),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
