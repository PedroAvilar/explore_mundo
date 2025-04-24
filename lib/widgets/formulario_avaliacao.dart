import 'package:flutter/material.dart';

class FormularioAvaliacao extends StatefulWidget {
  final void Function(String nome, int estrelas, String comentario) onEnviar;

  const FormularioAvaliacao({super.key, required this.onEnviar});

  @override
  State<FormularioAvaliacao> createState() => _FormularioAvaliacaoState();
}

class _FormularioAvaliacaoState extends State<FormularioAvaliacao> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _comentarioController = TextEditingController();
  int _estrelasSelecionadas = 5;

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
              const Text(
                'Deixe sua avaliação',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _comentarioController,
                decoration: const InputDecoration(labelText: 'Comentário'),
                validator: (value) => value!.isEmpty ? 'Digite um comentário' : null,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final selected = index < _estrelasSelecionadas;
                  return IconButton(
                    icon: Icon(
                      selected ? Icons.star : Icons.star_border,
                      color: selected ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _estrelasSelecionadas = index + 1);
                    },
                  );
                }),
              ),
              const SizedBox(height: 12),
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