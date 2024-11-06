import 'package:flutter/material.dart';
import 'detalhes_tempero_screen.dart'; // Verifique se este caminho está correto

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  _CatalogoScreenState createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  List<Map<String, dynamic>> temperos = [
    {
      'nome': 'Colorau',
      'preco': 4.0,
      'imagem': 'assets/colorau.jpg',
      'estoque': 5,
    },
    {
      'nome': 'Açafrão',
      'preco': 15.0,
      'imagem': 'assets/acafrao.jpg',
      'estoque': 0, // Sem estoque
    },
    {
      'nome': 'Chimichurri',
      'preco': 12.0,
      'imagem': 'assets/chimichurri.jpg',
      'estoque': 3,
    },
  ];

  void _adicionarAoCarrinho(String nome) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$nome adicionado ao carrinho!')),
    );
  }

  void _removerTempero(int index) {
    setState(() {
      temperos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Temperos'),
        backgroundColor: Colors.green[800],
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
                    onPressed: tempero['estoque'] > 0 ? () => _adicionarAoCarrinho(tempero['nome']) : null,
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
    );
  }
}
