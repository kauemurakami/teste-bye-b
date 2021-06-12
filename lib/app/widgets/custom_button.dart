import 'package:flutter/material.dart';

class CustomButtonWidget extends Container {
  final text, color, callback;
  CustomButtonWidget(this.callback, this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(this.text),
      onPressed: () => this.callback(),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: this.color!),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
