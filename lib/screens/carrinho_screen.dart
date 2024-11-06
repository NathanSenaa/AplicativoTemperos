import 'package:flutter/material.dart';

class CarrinhoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> produtosNoCarrinho;

  CarrinhoScreen({required this.produtosNoCarrinho});

  @override
  Widget build(BuildContext context) {
    double valorTotal = produtosNoCarrinho.fold(
      0,
      (total, item) => total + item['preco'],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        backgroundColor: Colors.green[800],
      ),
      body: produtosNoCarrinho.isEmpty
          ? Center(
              child: Text('Seu carrinho está vazio.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: produtosNoCarrinho.length,
                    itemBuilder: (context, index) {
                      final produto = produtosNoCarrinho[index];
                      return ListTile(
                        title: Text(produto['nome']),
                        subtitle: Text('R\$ ${produto['preco'].toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: R\$ ${valorTotal.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
    );
  }
}
