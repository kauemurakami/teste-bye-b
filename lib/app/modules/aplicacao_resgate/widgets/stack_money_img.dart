import 'package:byebank/core/utils/percent_size.dart';
import 'package:byebank/core/values/keys.dart';
import 'package:flutter/material.dart';

class StackImageMoneyWidget extends Container {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: SizeConfig.hp(20.0),
        width: SizeConfig.hp(20.0),
        bottom: -18.0,
        left: 0.0,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('${IMAGES_PATH}money.png')))));
  }
}
