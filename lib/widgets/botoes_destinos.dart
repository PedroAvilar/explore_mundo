import 'package:explore_mundo/utils/abrir_mapa.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

//Botões para ligar, rota e compartilhar nos destinos
Widget buildButtonColumn(
  Color color,
  IconData icon,
  String label,
  String action,
  BuildContext context, {
    String? nome,
    String? telefone,
    String? endereco,
    double? mediaEstrelas,
  }) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: Icon(icon, color: color),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Não foi possível abrir o discador')),
                );
              }
            }

          //Ação de rota
          } else if (action == 'ROTA') {
            //Caso não tenha rota
            if(endereco ==null || endereco.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Localização não disponível')),
              );
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Informações copiadas para a área de transferência.')),
              );
            } else {
              //Em dispositivos móveis
              await Share.share(info);
            }
          }
        },
      ),
      Text(
        label,
        style: TextStyle(color: color),
      ),
    ],
  );
}