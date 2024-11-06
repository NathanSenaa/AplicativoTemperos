import 'package:flutter/material.dart';

class AdicionarTemperoScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onAdicionarTempero;

  AdicionarTemperoScreen({required this.onAdicionarTempero});

  @override
  _AdicionarTemperoScreenState createState() => _AdicionarTemperoScreenState();
}

class _AdicionarTemperoScreenState extends State<AdicionarTemperoScreen> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _estoqueController = TextEditingController();

  void _salvarNovoTempero() {
    final novoTempero = {
      'nome': _nomeController.text,
      'preco': double.tryParse(_precoController.text) ?? 0.0,
      'descricao': _descricaoController.text,
      'estoque': int.tryParse(_estoqueController.text) ?? 0,
      'imagem': 'assets/default_tempero.jpg', // Exemplo de imagem padrão
    };
    widget.onAdicionarTempero(novoTempero);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Novo Tempero'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Tempero'),
            ),
            TextField(
              controller: _precoController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _estoqueController,
              decoration: InputDecoration(labelText: 'Estoque'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarNovoTempero,
              child: Text('Adicionar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
