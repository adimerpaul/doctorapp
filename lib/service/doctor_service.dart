import 'dart:convert';

import 'package:doctorapp/model/doctor_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
class DoctorService{

  static Future<List<Doctor>> getDoctores() async {
    final url = Uri.parse("${dotenv.env['API_BASE_URL']}/doctores");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Doctor>.from(data.map((item) => Doctor.fromJson(item)));
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}