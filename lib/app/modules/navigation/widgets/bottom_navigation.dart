import 'package:byebank/app/modules/navigation/controller.dart';
import 'package:byebank/core/utils/percent_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lamp_bottom_navigation/lamp_bottom_navigation.dart';

class CustomBottomNavigationwidget extends Container {
  final controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => LampBottomNavigationBar(
          currentIndex: this.controller.index.value,
          iconSize: 24.0,
          width: SizeConfig.wp(100.0),
          onTap: (i) => this.controller.changePage(i),
          items: [Icons.home, Icons.attach_money_outlined],
        ));
  }
}
