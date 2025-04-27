import 'pacote.dart';
import 'avaliacao.dart';

final List<PacoteViagem> listaPacotes = [
  PacoteViagem(
    id: 'pacote1',
    nome: 'Aventura nos Alpes',
    descricao: '''
      Se você busca uma experiência única que combina aventura, tranquilidade e beleza natural, este pacote é perfeito.
      Desfrute de cinco dias de pura magia em um dos cenários naturais mais deslumbrantes do mundo: o magnífico Oeschinen Lake.

      ✅ Está incluído no pacote:
      ✈️ Passagem de ida e volta.
      🏨 Hospedagem: 4 noites em um charmoso hotel alpino, com café da manhã incluso, para que você comece seus dias com energia.
      🚠 Transporte: Transfer do aeroporto e acesso ao lago por teleférico, garantindo uma experiência prática e confortável.
      🌿 Passeios e atrações:
          ➤ Trilhas panorâmicas com vistas cinematográficas das montanhas.
          ➤ Passeio de barco nas águas azul-turquesa do lago.
          ➤ Para os aventureiros: tobogã alpino com descidas emocionantes!
          ➤ No inverno: caminhada na neve e pesca no gelo, para explorar a natureza em sua forma mais pura.

      Garanta já a sua vaga e venha viver momentos inesquecíveis! ✨
    ''',
    destinos: ['Oeschinen Lake'],
    preco: '5.599,90',
    duracaoDias: 5,
    imagem: [
      'assets/imagens_lugares/Oeschinen/oeschinen-lake.jpg',
      'assets/imagens_lugares/Oeschinen/oeschinen-lake-1.jpg',
      'assets/imagens_lugares/Oeschinen/oeschinen-lake-2.jpg',
      'assets/imagens_lugares/Oeschinen/oeschinen-lake-3.jpg'
    ],
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
    descricao: '''
      Explore um dos lugares mais mágicos da Suíça, vivenciando um conto de fadas com a perfeita combinação de aventura, tranquilidade e paisagens de tirar o fôlego.

      ✅ Está incluído no pacote:
      ✈️ Passagem de ida e volta.
      🏨 Hospedagem: 6 noites em um charmoso hotel alpino, com café da manhã incluso, proporcionando conforto e sabor pela manhã.
      🚆 Transporte: Transfer do aeroporto e acesso facilitado a Lauterbrunnen por trem ou carro, garantindo uma viagem tranquila.
      🌿 Passeios e atrações:
          ➤ Exploração das 72 cachoeiras que adornam o vale, incluindo a impressionante Staubbachfall.
          ➤ Trilhas panorâmicas e passeios de bicicleta por paisagens incríveis.
          ➤ Viagem até Jungfraujoch - O Topo da Europa, onde você poderá ver geleiras eternas e sentir o poder dos Alpes.
          ➤ No inverno: Esportes na neve, incluindo esqui e snowboard para os aventureiros.

      Garanta já a sua vaga e venha viver momentos inesquecíveis! ✨
    ''',
    destinos: ['Lauterbrunnen'],
    preco: '5.999,90',
    duracaoDias: 7,
    imagem: [
      'assets/imagens_lugares/Lauterbrunnen/lauterbrunnen.jpg',
      'assets/imagens_lugares/Lauterbrunnen/lauterbrunnen-1.jpg',
      'assets/imagens_lugares/Lauterbrunnen/lauterbrunnen-2.jpg',
      'assets/imagens_lugares/Lauterbrunnen/lauterbrunnen-3.jpg'
    ],
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
    descricao: '''
      Prepare-se para uma aventura inesquecível em Zermatt! Este pacote proporciona uma experiência completa no coração dos Alpes Suíços, oferecendo paisagens de tirar o fôlego, tranquilidade e atrações únicas.
      Conheça a cidade livre de carros, oferecendo um ambiente tranquilo e ideal para explorar a pé ou utilizando transportes elétricos.

      ✅ Está incluído no pacote:
      ✈️ Passagem de ida e volta.
      🏨 Hospedagem: 10 noites em acomodações aconchegantes e bem localizadas, com café da manhã incluso.
      🚆 Transporte: Transfers do aeroporto e transporte local para facilitar seus deslocamentos em Zermatt.
      🌿 Passeios e atrações:
          ➤ Visita ao Matterhorn Glacier Paradise – o ponto mais alto da Europa acessível por teleférico.
          ➤ Passeio pela Gornergrat Railway, com vistas espetaculares das montanhas.
          ➤ Entrada para o Museu Matterhorn, para mergulhar na história e alpinismo da região.
          ➤ Trilhas guiadas durante o verão ou experiências únicas de esqui durante o inverno.

      Garanta já a sua vaga e venha viver momentos inesquecíveis! ✨
    ''',
    destinos: ['Zermatt'],
    preco: '6.599,90',
    duracaoDias: 10,
    imagem: [
      'assets/imagens_lugares/Zermatt/zermatt.jpg',
      'assets/imagens_lugares/Zermatt/zermatt-1.jpg',
      'assets/imagens_lugares/Zermatt/zermatt-2.jpg',
      'assets/imagens_lugares/Zermatt/zermatt-3.jpg'
    ],
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