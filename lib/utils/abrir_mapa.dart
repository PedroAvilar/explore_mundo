import 'package:explore_mundo/utils/mensagens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Função auxiliar para abrir o mapa do destino
Future<void> abrirMapa(String endereco, BuildContext context) async {
  final uriGeo = Uri.parse('geo:0,0?q=${Uri.encodeComponent(endereco)}');
  final uriWeb = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(endereco)}');

  if (await canLaunchUrl(uriGeo)) {
    await launchUrl(uriGeo);
  } else if (await canLaunchUrl(uriWeb)) {
    await launchUrl(uriWeb, mode: LaunchMode.externalApplication);
  } else {
    Mensagens.erro('Não foi possível abrir o mapa');
  }
}