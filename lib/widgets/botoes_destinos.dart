import 'package:flutter/material.dart';

Widget _buildButtonColumn(Color color, IconData icon, String label, String action) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          if (action == 'LIGAR') {
            print("Ligar para o destino");
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