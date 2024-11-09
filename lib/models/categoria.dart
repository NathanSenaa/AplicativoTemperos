// lib/models/categoria.dart
import 'tempero.dart';

class Categoria {
  final int id;
  final String nome;
  final List<Tempero> temperos;

  Categoria({
    required this.id,
    required this.nome,
    required this.temperos,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nome: json['nome'],
      temperos: (json['temperos'] as List)
          .map((tempero) => Tempero.fromJson(tempero))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'temperos': temperos.map((tempero) => tempero.toJson()).toList(),
    };
  }
}
