import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/catalogo_screen.dart';
import 'screens/detalhes_tempero_screen.dart';

void main() {
  runApp(TemperosApp());
}

class TemperosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Temperos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/catalogo': (context) => CatalogoScreen(),
        '/detalhes': (context) => DetalhesTemperoScreen(tempero: {
          'nome': 'Nome do Tempero',
          'preco': 0.0,
          'imagem': 'assets/default.jpg',
          'estoque': 0,
          'descricao': 'Descrição do tempero',
        }),
      },
    );
  }
}
