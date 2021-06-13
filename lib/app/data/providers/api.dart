import 'dart:convert';
import 'package:byebank/app/data/models/app_error.dart';
import 'package:byebank/app/data/models/movimentacoes.dart';
import 'package:byebank/app/data/models/user.dart';
import 'package:byebank/app/data/services/auth/service.dart';
import 'package:byebank/core/utils/headers.dart';
import 'package:get/get.dart';

const baseUrl = 'https://mrwffgnpgf.execute-api.sa-east-1.amazonaws.com/prod';

class MyApi extends GetConnect {
  login(email, senha) async {
    AuthService auth = Get.find<AuthService>();
    final response = await post('$baseUrl/login',
        json.encode({"username": "$email", "password": "$senha"}),
        decoder: (res) {
      if (res['token'] != null && res['token'] != '') {
        auth.token.value = res['token'];
      }

      return res;
    });
    if (response.statusCode == 200) {
      auth.user.update((val) {
        val?.username = email;
        val?.senha = senha;
      });
      return auth.user;
    } else if (response.statusCode == 500) {
      return AppError(errors: 'Erro desconhecido');
    } else {
      return AppError.fromJson(response.body);
    }
  }

  getMovimentacoes() async {
    var movs = Movimentacoes().obs;
    AuthService auth = Get.find<AuthService>();
    final response = await get<Rx<Movimentacoes>>('$baseUrl/movimentacoes',
        headers: HeadersAPI(token: auth.token.value).getHeaders(),
        decoder: (res) {
      // print(res);
      var m = Movimentacoes.fromJson(res).obs;
      movs.value.movimentacoes = m.value.movimentacoes;
      print(movs.value.movimentacoes?[0].tipo);
      return movs;
    });
    if (response.hasError) {
      throw AppError();
    }
    if (response.statusCode == 500) {
      return AppError(errors: 'Erro desconhecido');
    }
    return movs;
  }

  solicitarAplicacao() {}
  solicitarResgate() {}
}
