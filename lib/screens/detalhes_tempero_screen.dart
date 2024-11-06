import 'package:flutter/material.dart';

class DetalhesTemperoScreen extends StatelessWidget {
  final Map<String, dynamic> tempero;

  const DetalhesTemperoScreen({super.key, required this.tempero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tempero['nome']),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              tempero['imagem'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              tempero['nome'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'R\$ ${tempero['preco'].toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            if (tempero['estoque'] == 0)
              const Text(
                'Sem estoque',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
