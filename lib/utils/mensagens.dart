import 'package:flutter/material.dart';

//Classse auxiliar para exibir mensagens ao usuário
class Mensagens {

  //Sucesso
  static void sucesso(BuildContext context, String mensagem) {
    _mostrarSnackBar(
      context,
      mensagem,
      Colors.greenAccent,
      Icons.check_circle_outline,
      Colors.black,
    );
  }

  //Erro
  static void erro(BuildContext context, String mensagem) {
    _mostrarSnackBar(
      context,
      mensagem,
      Colors.redAccent,
      Icons.error_outline,
      Colors.white,
    );
  }

  //Aviso
  static void aviso(BuildContext context, String mensagem) {
    _mostrarSnackBar(
      context,
      mensagem,
      Colors.amberAccent,
      Icons.warning_amber_outlined,
      Colors.black,
    );
  }

  //Função interna para exibir o SnackBar
  static void _mostrarSnackBar(
    BuildContext context,
    String mensagem,
    Color corFundo,
    IconData icone,
    Color corTexto,
  ) {

    //Proteção contra uso de context inválido
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
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