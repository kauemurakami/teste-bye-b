import 'dart:convert';

AppError appErrorFromJson(String str) => AppError.fromJson(json.decode(str));

String appErrorToJson(AppError data) => json.encode(data.toJson());

class AppError {
  AppError({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory AppError.fromJson(Map<String, dynamic> json) => AppError(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
