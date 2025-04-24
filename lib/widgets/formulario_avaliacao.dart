import 'package:flutter/material.dart';

//Widget com formulário para envio de avaliação
class FormularioAvaliacao extends StatefulWidget {

  //Função callbak para enviar os dados preenchidos no formulário
  final void Function(String nome, int estrelas, String comentario) onEnviar;

  const FormularioAvaliacao({super.key, required this.onEnviar});

  @override
  State<FormularioAvaliacao> createState() => _FormularioAvaliacaoState();
}

//Estado do widget que lida com campos de texto, seleção de estrelas e envio
class _FormularioAvaliacaoState extends State<FormularioAvaliacao> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _comentarioController = TextEditingController();
  int _estrelasSelecionadas = 5;

  //Método chamado ao preesionar o botão de envio
  void _submeterFormulario() {
    if (_formKey.currentState!.validate()) {
      widget.onEnviar(
        _nomeController.text,
        _estrelasSelecionadas,
        _comentarioController.text,
      );
      _nomeController.clear();
      _comentarioController.clear();
      setState(() => _estrelasSelecionadas = 5);

      //Exibe mensagem de sucesso ao enviar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Avaliação enviada com sucesso!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.lightGreen,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Título do formulário
              const Text(
                'Deixe sua avaliação',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //Campo de entrada do nome
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Seu nome'),
                validator: (value) => value!.isEmpty ? 'Digite seu nome' : null,
              ),
              //Campo de entrada do comentário
              TextFormField(
                controller: _comentarioController,
                decoration: const InputDecoration(labelText: 'Comentário'),
                validator: (value) => value!.isEmpty ? 'Digite um comentário' : null,
              ),
              const SizedBox(height: 12),
              //Linha de botões de estrelas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final selected = index < _estrelasSelecionadas;
                  return IconButton(
                    icon: Icon(
                      selected ? Icons.star : Icons.star_border,
                      color: selected ? Colors.amber : Colors.grey,
                    ),
                    //Atualiza o número de estrelas selecionadas
                    onPressed: () {
                      setState(() => _estrelasSelecionadas = index + 1);
                    },
                  );
                }),
              ),
              const SizedBox(height: 12),
              //Botão de envio do formulário
              ElevatedButton(
                onPressed: _submeterFormulario,
                child: const Text('Enviar avaliação'))
            ],
          ),
        ),
      ),
    );
  }
}