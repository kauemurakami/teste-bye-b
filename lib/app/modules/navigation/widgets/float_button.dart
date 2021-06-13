import 'package:byebank/app/modules/navigation/controller.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:byebank/routes/pages.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingButtonMenuWidget extends Container {
  final controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      icon: AnimatedIcons.menu_close,

      // Menu items
      items: <Bubble>[
        Bubble(
          title: "Sair",
          iconColor: redColor,
          bubbleColor:
              this.controller.config!.getTheme() ? whiteColor : blackColor,
          icon: Icons.logout_outlined,
          titleStyle: TextStyle(
              fontSize: 16,
              color:
                  this.controller.config!.getTheme() ? blackColor : whiteColor),
          onPress: () {
            this.controller.animationController?.reverse();
            Get.offAllNamed(Routes.LOGIN);
          },
        ),
        Bubble(
          title: "Tema",
          iconColor:
              this.controller.config!.getTheme() ? blackColor : whiteColor,
          bubbleColor:
              this.controller.config!.getTheme() ? whiteColor : blackColor,
          icon: this.controller.config!.getTheme()
              ? Icons.brightness_5_outlined
              : Icons.brightness_4_outlined,
          titleStyle: TextStyle(
              fontSize: 16,
              color:
                  this.controller.config!.getTheme() ? blackColor : whiteColor),
          onPress: () {
            this
                .controller
                .config!
                .changeTheme(!this.controller.config!.getTheme());
            this.controller.animationController?.reverse();
          },
        ),
      ],

      animation: this.controller.animation,

      onPress: () => this.controller.animationController!.isCompleted
          ? this.controller.animationController?.reverse()
          : this.controller.animationController?.forward(),

      iconColor: blackColor,
    );
  }
}
