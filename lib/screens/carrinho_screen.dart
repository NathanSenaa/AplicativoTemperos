import 'package:flutter/material.dart';

class CarrinhoScreen extends StatefulWidget {
  final List<Map<String, dynamic>> produtosNoCarrinho;

  CarrinhoScreen({required this.produtosNoCarrinho});

  @override
  _CarrinhoScreenState createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  late double valorTotal;

  @override
  void initState() {
    super.initState();
    _atualizarValorTotal();
  }

  void _atualizarValorTotal() {
    setState(() {
      valorTotal = widget.produtosNoCarrinho.fold(
        0,
        (total, item) => total + item['preco'],
      );
    });
  }

  void _removerProduto(int index) {
    setState(() {
      widget.produtosNoCarrinho.removeAt(index);
      _atualizarValorTotal();
    });
  }

  void _finalizarCompra() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pagamento Aprovado'),
        content: Text('Retire seu produto na loja Sena Condimentos'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fecha o diálogo
              Navigator.pop(context); // Retorna à tela anterior
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        backgroundColor: Colors.green[800],
      ),
      body: widget.produtosNoCarrinho.isEmpty
          ? Center(
              child: Text('Seu carrinho está vazio.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.produtosNoCarrinho.length,
                    itemBuilder: (context, index) {
                      final produto = widget.produtosNoCarrinho[index];
                      return ListTile(
                        title: Text(produto['nome']),
                        subtitle: Text('R\$ ${produto['preco'].toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => _removerProduto(index),
                        ),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _finalizarCompra,
                    child: Text('Ir para o Pagamento'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800], // Corrigido aqui
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
