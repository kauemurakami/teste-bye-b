import 'package:byebank/app/data/services/configs/service.dart';
import 'package:byebank/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTfWidget extends Container {
  final config = Get.find<AppConfigService>();

  final Function(String s)? onChanged;
  final TextEditingController? controller;
  final text, size, obscure, check, icon, type;
  CustomTfWidget({
    this.text,
    this.type,
    this.controller,
    this.icon,
    this.obscure = false,
    this.check = false,
    this.size,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.size,
        child: Theme(
          data: new ThemeData(
              inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        this.config.getTheme() ? Colors.white : Colors.black)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        this.config.getTheme() ? Colors.white : Colors.black)),
            focusColor: this.config.getTheme() ? Colors.white : Colors.black,
          )),
          child: TextField(
            style: TextStyle(
                color: this.config.getTheme() ? Colors.white : Colors.black),
            controller: this.controller,
            obscureText: this.obscure,
            onChanged: (v) => this.onChanged!(v),
            cursorColor: blackColor,
            keyboardType: this.type,
            decoration: new InputDecoration(
              labelStyle: TextStyle(
                  color: this.config.getTheme() ? Colors.white : Colors.black),
              suffixIcon:
                  Icon(this.icon, color: this.check ? blackColor : Colors.grey),
              labelText: this.text,
            ),
          ),
        ));
  }
}
