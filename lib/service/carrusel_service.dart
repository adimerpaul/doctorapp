import 'package:doctorapp/model/carrusel_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class CarruselService{
  static final String _baseUrl = dotenv.env['API_BASE_URL'] ?? '';

  static Future<List<Carrusel>> getCarrusels() async {
    final response = await http.get(Uri.parse('$_baseUrl/carrusel'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Carrusel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load carrusels');
    }
  }
}