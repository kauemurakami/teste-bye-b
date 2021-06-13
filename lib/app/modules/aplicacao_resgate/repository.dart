import 'package:byebank/app/data/providers/api.dart';

class AplicacaoResgateRepository {
  final MyApi api;

  AplicacaoResgateRepository(this.api);

  aplicar(valor) => this.api.solicitarAplicacao(valor);
  resgatar(valor) => this.api.solicitarResgate(valor);
}
