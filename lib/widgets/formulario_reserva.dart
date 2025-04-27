import 'package:flutter/material.dart';

//Widget para formulário de reserva
void mostrarFormularioReserva(BuildContext context) {
  //Chave para validar o formulário
  final formKey = GlobalKey<FormState>();
  //Controladores para capturar os dados dos campos
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final pessoasController = TextEditingController();
  final dataController = TextEditingController();
  final obsController = TextEditingController();

  //Exibe o modal na tela
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Título do formulário
                const Text(
                  'Reserva do pacote',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                //Campo para nome
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome completo'),
                  validator: (value) => value!.isEmpty ? 'Digite seu nome' : null,
                ),
                //Campo para e-mail
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) => value!.isEmpty ? 'Digite seu e-mail' : null,
                ),
                //Campo para quantidades de pessoas
                TextFormField(
                  controller: pessoasController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Número de pessoas'),
                  validator: (value) => value!.isEmpty ? 'Informe o número' : null,
                ),
                //Campo para data de ida
                TextFormField(
                  controller: dataController,
                  decoration: const InputDecoration(labelText: 'Data de ida'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    //Abre o seletor de data
                    DateTime? dataSelecionada = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    //Preenche o campo com a data escolhida
                    if (dataSelecionada != null) {
                      dataController.text = '${dataSelecionada.day}/${dataSelecionada.month}/${dataSelecionada.year}';
                    }
                  },
                  validator: (value) => value!.isEmpty ? 'Escolha uma data' : null,
                ),
                //Campo opcional para observações
                TextFormField(
                  controller: obsController,
                  decoration: const InputDecoration(labelText: 'Observações'),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                //Botão de confirmar
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check, size: 22),
                      label: const Text(
                        'Confirmar reserva',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Reserva realizada com sucesso!')),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
