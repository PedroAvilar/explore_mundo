import 'avaliacao.dart';

//Modelo de pacote de viagem
class PacoteViagem{
  final String id;
  final String nome;
  final String descricao;
  final List<String> destinos;
  final String preco;
  final int duracaoDias;
  final List<String> imagem;
  final List<Avaliacao> avaliacoes;

  PacoteViagem({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.destinos,
    required this.preco,
    required this.duracaoDias,
    required this.imagem,
    required this.avaliacoes,
  });
}