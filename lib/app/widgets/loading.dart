import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomLoadingWidget extends Container {
  final config = Get.find<AppConfigService>();
  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: this.config.getTheme() ? whiteColor : blackColor,
      size: SizeConfig.wp(10),
    );
  }
}
