import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

//Classse auxiliar para exibir mensagens ao usuário
class Mensagens {

  //Sucesso
  static void sucesso(String mensagem) {
    _mostrarSnackBar(
      mensagem,
      Colors.greenAccent,
      Icons.check_circle_outline,
      Colors.black,
    );
  }

  //Erro
  static void erro(String mensagem) {
    _mostrarSnackBar(
      mensagem,
      Colors.redAccent,
      Icons.error_outline,
      Colors.white,
    );
  }

  //Aviso
  static void aviso(String mensagem) {
    _mostrarSnackBar(
      mensagem,
      Colors.amberAccent,
      Icons.warning_amber_outlined,
      Colors.black,
    );
  }

  //Função interna para exibir o SnackBar
  static void _mostrarSnackBar(
    String mensagem,
    Color corFundo,
    IconData icone,
    Color corTexto,
  ) {

    //Proteção contra uso de context inválido
    if (!scaffoldMessengerKey.currentState!.mounted) return;

    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: corFundo,
        duration: const Duration(seconds: 4),
        content: Row(
          children: [
            Icon(icone, color: corTexto, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                mensagem,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: corTexto,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}