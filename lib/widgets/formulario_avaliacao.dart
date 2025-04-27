import 'package:explore_mundo/utils/mensagens.dart';
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

  //Método chamado ao pressionar o botão de envio
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

      //Exibe mensagem
      Mensagens.sucesso(context, 'Avaliação enviada com sucesso');
    } else {
      Mensagens.aviso(context, 'Por favor, preencha os campos.');
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
              ElevatedButton.icon(
                icon: const Icon(Icons.rate_review, size: 20),
                label: const Text(
                  'Enviar avaliação',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _submeterFormulario,
              ),
            ],
          ),
        ),
      ),
    );
  }
}