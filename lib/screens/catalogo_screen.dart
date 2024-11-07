import 'package:flutter/material.dart';
import 'detalhes_tempero_screen.dart';
import 'editar_tempero_screen.dart';
import 'adicionar_tempero_screen.dart';
import 'carrinho_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  _CatalogoScreenState createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  List<Map<String, dynamic>> produtosNoCarrinho = [];
  List<Map<String, dynamic>> temperos = [
    {
      'nome': 'Colorau',
      'preco': 4.0,
      'imagem': 'assets/colorau.jpg',
      'estoque': 5,
      'descricao': 'Colorau é um tempero essencial para dar cor e sabor a pratos tradicionais.',
    },
    {
      'nome': 'Açafrão',
      'preco': 15.0,
      'imagem': 'assets/acafrao.jpg',
      'estoque': 0,
      'descricao': 'Açafrão, conhecido por seu sabor e cor intensa, é muito utilizado em risotos e pratos exóticos.',
    },
    {
      'nome': 'Chimichurri',
      'preco': 12.0,
      'imagem': 'assets/chimichurri.jpg',
      'estoque': 3,
      'descricao': 'Chimichurri é uma mistura de especiarias ideal para churrascos e pratos de carne.',
    },
  ];

  void _adicionarAoCarrinho(Map<String, dynamic> produto) {
    setState(() {
      produtosNoCarrinho.add(produto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produto['nome']} adicionado ao carrinho!')),
      );
    });
  }

  void _removerTempero(int index) {
    setState(() {
      temperos.removeAt(index);
    });
  }

  void _editarTempero(int index) {
    final tempero = temperos[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarTemperoScreen(
          tempero: tempero,
          onSave: (updatedTempero) {
            setState(() {
              temperos[index] = updatedTempero;
            });
          },
        ),
      ),
    );
  }

  void _adicionarNovoTempero(Map<String, dynamic> novoTempero) {
    setState(() {
      temperos.add(novoTempero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Temperos'),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarrinhoScreen(produtosNoCarrinho: produtosNoCarrinho),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: temperos.length,
        itemBuilder: (context, index) {
          final tempero = temperos[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                tempero['imagem'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(tempero['nome']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('R\$ ${tempero['preco'].toStringAsFixed(2)}'),
                  Text(tempero['descricao']),
                  if (tempero['estoque'] == 0)
                    const Text(
                      'Sem estoque',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: tempero['estoque'] > 0 ? () => _adicionarAoCarrinho(tempero) : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editarTempero(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removerTempero(index),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesTemperoScreen(tempero: tempero),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarTemperoScreen(onAdicionarTempero: _adicionarNovoTempero),
            ),
          );
        },
        backgroundColor: Colors.green[800],
        child: Icon(Icons.add),
      ),
    );
  }
}
