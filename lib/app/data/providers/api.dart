import 'dart:convert';
import 'package:byebank/app/data/models/app_error.dart';
import 'package:byebank/app/data/models/user.dart';
import 'package:byebank/app/data/services/auth/service.dart';
import 'package:get/get.dart';

const baseUrl = 'https://mrwffgnpgf.execute-api.sa-east-1.amazonaws.com/prod';

class MyApi extends GetConnect {
  login(email, senha) async {
    AuthService auth = Get.find<AuthService>();
    final response = await post('$baseUrl/login',
        json.encode({"username": "$email", "password": "$senha"}),
        decoder: (res) {
      print(res);
      return res;
    });
    if (response.statusCode == 200) {
      auth.user.update((val) => auth.user.value = User.fromJson(response.body));
      return auth.user;
    } else {
      return AppError.fromJson(response.body);
    }
  }

  movimentacoes() {}
  solicitarAplicacao() {}
  solicitarResgate() {}
}
