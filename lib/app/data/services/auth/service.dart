import 'package:byebank/app/data/models/user.dart';
import 'package:byebank/app/data/providers/api.dart';
import 'package:byebank/app/data/services/auth/repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    this.repository = AuthRepository(MyApi());
    return this;
  }

  final token = ''.obs;
  AuthRepository? repository;
  final user = User().obs;

  login(email, senha) async {
    var data = await this.repository?.login(email, senha);
    return data;
  }

  logout() async {}
}
