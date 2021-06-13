import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonChangeThemewidget extends Container {
  final config = Get.find<AppConfigService>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 8.0,
        top: 8.0,
        child: IconButton(
            onPressed: () => this.config.changeTheme(!this.config.getTheme()),
            icon: Icon(
              this.config.getTheme()
                  ? Icons.brightness_5_outlined
                  : Icons.brightness_4_outlined,
              color: this.config.getTheme() ? whiteColor : blackColor,
              size: 32.0,
            )));
  }
}
