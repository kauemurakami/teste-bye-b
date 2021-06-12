import 'package:byebank/app/data/providers/api.dart';

class AuthRepository {
  final MyApi api;

  AuthRepository(this.api);

  login(email, senha) => this.api.login(email, senha);
}
