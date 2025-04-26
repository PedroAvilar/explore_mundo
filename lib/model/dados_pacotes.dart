import 'pacote.dart';
import 'avaliacao.dart';

final List<PacoteViagem> listaPacotes = [
  PacoteViagem(
    id: 'pacote1',
    nome: 'Aventura nos Alpes',
    descricao: 'Explore trilhas incríveis, lagos cristalinos os Alpes suíços.',
    destinos: ['Oeschinen Lake'],
    preco: 2499.99,
    duracaoDias: 5,
    imagem: 'assets/imagens_lugares/oeschinen-lake.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Will Avilar',
        estrelas: 5,
        comentario: 'Dias incríveis, o pacote facilita acesso aos passeios.'
      ),
      Avaliacao(
        nome: 'Claudio Santos',
        estrelas: 4,
        comentario: 'Minha família adorou cada dia. Queremos voltar em breve.'
      ),
    ],
  ),
  PacoteViagem(
    id: 'pacote2',
    nome: 'Encanto das cachoeiras',
    descricao: 'Conheça Lauterbrunnen e viva todo o encanto oferecido pelo vilarejo rodeado de cachoeiras.',
    destinos: ['Lauterbrunnen'],
    preco: 2899.00,
    duracaoDias: 7,
    imagem: 'assets/imagens_lugares/lauterbrunnen.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Laisa Araújo',
        estrelas: 3,
        comentario: 'Ótima experiência, poderia incluir pets.'
      ),
      Avaliacao(
        nome: 'Luci Avilar',
        estrelas: 5,
        comentario: 'Melhores dias da minha vida, vale a pena, recomendo muito.'
      ),
    ],
  ),
  PacoteViagem(
    id: 'pacote3',
    nome: 'Cidade sem carros',
    descricao: 'Aventura, tranquilidade e lazer em qualquer estação do ano.',
    destinos: ['Zermatt'],
    preco: 4990.00,
    duracaoDias: 10,
    imagem: 'assets/imagens_lugares/zermatt.jpg',
    avaliacoes: [
      Avaliacao(
        nome: 'Toddy Bear',
        estrelas: 5,
        comentario: 'O pacote poderia durar minha vida inteira, amei o lugar.'
      ),
      Avaliacao(
        nome: 'Clara White',
        estrelas: 5,
        comentario: 'Cidade maravilhosa. A vista das montanhas e o pôr do sol são incríveis.'
      ),
    ],
  ),
];