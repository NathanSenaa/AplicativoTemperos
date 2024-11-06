import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/catalogo_screen.dart';
import 'screens/formulario_temperos.dart';
import 'screens/detalhes_tempero_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';

void main() {
  runApp(TemperosApp());
}

class TemperosApp extends StatelessWidget {
  const TemperosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sena Condimentos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/catalogo': (context) => CatalogoScreen(),
        '/detalhes': (context) => DetalhesTemperoScreen(tempero: const {}),
      },
    );
  }
}
