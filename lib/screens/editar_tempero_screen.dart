import 'package:flutter/material.dart';

class EditarTemperoScreen extends StatefulWidget {
  final Map<String, dynamic> tempero;
  final Function(Map<String, dynamic>) onSave;

  const EditarTemperoScreen({super.key, required this.tempero, required this.onSave});

  @override
  _EditarTemperoScreenState createState() => _EditarTemperoScreenState();
}

class _EditarTemperoScreenState extends State<EditarTemperoScreen> {
  late TextEditingController _nomeController;
  late TextEditingController _precoController;
  late TextEditingController _descricaoController;
  late TextEditingController _estoqueController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.tempero['nome']);
    _precoController = TextEditingController(text: widget.tempero['preco'].toString());
    _descricaoController = TextEditingController(text: widget.tempero['descricao']);
    _estoqueController = TextEditingController(text: widget.tempero['estoque'].toString());
  }

  void _salvarAlteracoes() {
    final updatedTempero = {
      'nome': _nomeController.text,
      'preco': double.tryParse(_precoController.text) ?? 0.0,
      'descricao': _descricaoController.text,
      'estoque': int.tryParse(_estoqueController.text) ?? 0,
      'imagem': widget.tempero['imagem'], // Mantém a imagem original
    };
    widget.onSave(updatedTempero);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tempero'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _estoqueController,
              decoration: const InputDecoration(labelText: 'Estoque'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarAlteracoes,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
