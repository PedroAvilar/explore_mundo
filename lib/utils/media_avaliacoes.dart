import '../model/avaliacao.dart';

double calcularMediaAvaliacoes(List<Avaliacao> avaliacoes) {
  if (avaliacoes.isEmpty) return 0.0;
  int totalEstrelas = avaliacoes.fold(0, (soma, a) => soma + a.estrelas);
  return totalEstrelas / avaliacoes.length;
}