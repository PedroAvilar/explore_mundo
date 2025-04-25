import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Botões para ligar, rota e compartilhar nos destinos
Widget buildButtonColumn(
  Color color,
  IconData icon,
  String label,
  String action,
  BuildContext context, {
    String? telefone,
    String? endereco,
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
            //Codifica o endereço para ser usado na URL
            final encodedEndereco = Uri.encodeComponent(endereco);
            //Cria a URL de pesquisa do Google Maps com o edereço
            final Uri uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedEndereco');
            //Vertifica se é possível abrir a URL
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Não foi possível abrir o mapa')
              ));
            }

          } else if (action == 'COMPARTILHAR') {
            print("Compartilhar destino");
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