import 'package:byebank/app/data/providers/api.dart';

class AplicacaoResgateRepository {
  final MyApi api;

  AplicacaoResgateRepository(this.api);

  movimentacao(tipo, valor) => this.api.movimentacao(tipo, valor);
}
