import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class CustomSnackBarWidget extends Container {
  final String message;
  final IconData icon;
  CustomSnackBarWidget(this.message, this.icon);
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        width: GetPlatform.isMobile ? Get.width - 100.0 : Get.width / 2,
        blur: 20,
        height: 80.0,
        borderRadius: 12.0,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.5),
            Colors.black.withOpacity(0.6),
          ],
        ),
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.1),
              Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: [
              0.1,
              1,
            ]),
        border: 0,
        child: CustomSnackBar.success(
            icon: Icon(
              this.icon,
              color: blackColor,
              size: 120.0,
            ),
            backgroundColor: Colors.transparent,
            iconRotationAngle: 32,
            message: this.message));
  }
}
