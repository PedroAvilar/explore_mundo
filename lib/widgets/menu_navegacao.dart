import 'package:flutter/material.dart';

//Widget que representa o menu lateral da navegação
class MenuNavegacao extends StatelessWidget {

  //Função de callbak que será chamada ao selecionar uma rota
  final Function(String rota) ? aoSelecionar;

  //Construtor para a função de seleção de rota
  const MenuNavegacao({super.key, this.aoSelecionar});

  @override
  Widget build(BuildContext context) {
    //Menu lateral deslizante com uma lista de opções
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //Cabeçalho do menu, título
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Text(
              'Explore Mundo 🌍',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          //Item do menu: Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              aoSelecionar?.call('/');
              Navigator.pop(context);
            },
          ),
          //Item do menu: Destinos
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Destinos'),
            onTap: () {
              aoSelecionar?.call('/destinos');
              Navigator.pop(context);
            },
          ),
          //Item do menu: Pacotes de viagem
          ListTile(
            leading: const Icon(Icons.card_travel),
            title: const Text('Pacotes de viagem'),
            onTap: () {
              aoSelecionar?.call('/pacotes');
              Navigator.pop(context);
            },
          ),
          //Item do menu: Sobre nós
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre nós'),
            onTap: () {
              aoSelecionar?.call('/sobre');
              Navigator.pop(context);
            },
          ),
          //Item do menu: Contato
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contato'),
            onTap: () {
              aoSelecionar?.call('/contato');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}