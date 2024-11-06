import 'package:http/http.dart' as http;
import 'dart:convert';

class TemperosApiService {
  final String apiUrl = "http://localhost:3000/temperos";

  Future<List<Map<String, dynamic>>> fetchTemperos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar os temperos');
    }
  }

  Future<void> addTempero(Map<String, dynamic> tempero) async {
    await http.post(Uri.parse(apiUrl), body: json.encode(tempero), headers: {"Content-Type": "application/json"});
  }

  Future<void> updateTempero(int id, Map<String, dynamic> tempero) async {
    await http.put(Uri.parse('$apiUrl/$id'), body: json.encode(tempero), headers: {"Content-Type": "application/json"});
  }

  Future<void> deleteTempero(int id) async {
    await http.delete(Uri.parse('$apiUrl/$id'));
  }
}
