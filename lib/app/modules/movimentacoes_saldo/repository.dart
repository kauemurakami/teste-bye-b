import 'package:byebank/app/data/providers/api.dart';

class MovimentacoesSaldoRepository {
  final MyApi api;
  MovimentacoesSaldoRepository(this.api);

  getMovimentacoes() => this.api.getMovimentacoes();
}
