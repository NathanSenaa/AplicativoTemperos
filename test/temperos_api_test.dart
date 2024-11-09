// test/temperos_api_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:temperos_app/services/temperos_api.dart';

void main() {
  final apiService = TemperosApiService();

  test('fetchTemperos retorna uma lista de temperos', () async {
    final temperos = await apiService.fetchTemperos();
    expect(temperos, isA<List<Map<String, dynamic>>>());
  });

  test('addTempero adiciona um novo tempero', () async {
    final novoTempero = {
      'id': 3,
      'nome': 'Pimenta',
      'preco': 5.0,
      'estoque': 10,
      'categoriaId': 1,
    };
    await apiService.addTempero(novoTempero);
  });
}
