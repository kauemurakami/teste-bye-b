import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageLoginStakWidget extends Container {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: SizeConfig.wp(100.0),
      bottom: 0.0,
      left: 0.0,
      child: Image(
        image: AssetImage('${IMAGES_PATH}not_bank.png'),
      ),
    );
  }
}
