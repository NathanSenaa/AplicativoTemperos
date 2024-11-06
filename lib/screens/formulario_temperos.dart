import 'package:flutter/material.dart';

class FormularioTemperos extends StatefulWidget {
  const FormularioTemperos({super.key});

  @override
  _FormularioTemperosState createState() => _FormularioTemperosState();
}

class _FormularioTemperosState extends State<FormularioTemperos> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _estoqueController = TextEditingController();

  void _salvar() {
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final estoque = int.tryParse(_estoqueController.text) ?? 0;

    if (nome.isNotEmpty && preco > 0 && estoque >= 0) {
      // Adiciona a lógica para salvar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tempero cadastrado com sucesso!')),
      );
      _nomeController.clear();
      _precoController.clear();
      _estoqueController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os campos corretamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Temperos'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Tempero'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _estoqueController,
              decoration: const InputDecoration(labelText: 'Estoque'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
