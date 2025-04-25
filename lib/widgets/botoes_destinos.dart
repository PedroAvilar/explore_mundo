import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Botões para ligar, rota e compartilhar nos destinos
Widget buildButtonColumn(Color color, IconData icon, String label, String action, BuildContext context, {String? telefone}) {
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

            
          } else if (action == 'ROTA') {
            print("Abrir a rota para o destino");
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