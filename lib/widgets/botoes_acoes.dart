import 'package:explore_mundo/utils/abrir_mapa.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:explore_mundo/utils/mensagens.dart';

//Widget de botão de ação reutilizável para destinos e contato
Widget buildBotoesAcoes(
  IconData icon,
  String label,
  String action,
  BuildContext context, {
    String? nome,
    String? telefone,
    String? endereco,
    double? mediaEstrelas,
    String? email,
  }) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      SizedBox(
        width: 120,
        height: 40,
          child: IconButton(
            iconSize: 30,
            icon: Icon(icon, color: Colors.blueAccent),
            onPressed: () async {

              //Ação de ligar
              if (action == 'LIGAR') {
                if (kIsWeb) { 
                  //No navegador - caixa de diálogo
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Número de telefone'),
                      content: Text(telefone ?? 'Número não disponível'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  //Em dispositivos móveis - abre o discador
                  final Uri uri = Uri(scheme: 'tel', path: telefone);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    Mensagens.erro('Não foi possível abrir o discador');
                  }
                }

              //Ação de rota
              } else if (action == 'ROTA') {
                //Caso não tenha rota
                if(endereco ==null || endereco.isEmpty) {
                  Mensagens.erro('Localização não disponível');
                  return;
                }
                //Função auxiliar
                await abrirMapa(endereco, context);

              //Ação de compartilhar
              } else if (action == 'COMPARTILHAR') {
                final info = '''
    Confira este destino incrível no Explore Mundo! 🌍

    📍 Destino: ${ nome ?? "Nome não informado"}
    📌 Endereço: ${endereco ?? "Não informado"}
    📞 Telefone: ${telefone ?? "Não informado"}
    ⭐ Avaliação média: ${mediaEstrelas?.toStringAsFixed(1) ?? "Sem avaliações"}

    Acesse o app e explore mais!
                ''';
                if (kIsWeb) {
                  //No navegador
                  await Clipboard.setData(ClipboardData(text: info));
                  Mensagens.sucesso('Informações copiadas para a área de transferência.');
                } else {
                  //Em dispositivos móveis
                  await Share.share(info);
                }

              //Ação de enviar e-mail
              } else if (action == 'EMAIL') {
                final Uri url = Uri(
                  scheme: 'mailto',
                  path: email ?? 'contato@exploremundo.com',
                  query: 'subject=Contato pelo app Explore Mundo',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  Mensagens.erro('Não foi possível abrir o aplicativo de e-mail.');
                }
              }
            },
          ),
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500
        ),
      ),
    ],
  );
}

//Widget de botão de voltar
Widget buildBotaoVoltar(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () => Navigator.pop(context),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
    ),
    icon: const Icon(Icons.arrow_back_sharp, size: 20),
    label: const Text('Voltar', style: TextStyle(fontSize: 16)),
  );
}