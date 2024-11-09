// lib/models/tempero.dart
class Tempero {
  final int id;
  final String nome;
  final double preco;
  final int estoque;
  final int categoriaId;

  Tempero({
    required this.id,
    required this.nome,
    required this.preco,
    required this.estoque,
    required this.categoriaId,
  });

  factory Tempero.fromJson(Map<String, dynamic> json) {
    return Tempero(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
      estoque: json['estoque'],
      categoriaId: json['categoriaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'estoque': estoque,
      'categoriaId': categoriaId,
    };
  }
}
