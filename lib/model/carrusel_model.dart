import 'package:flutter_dotenv/flutter_dotenv.dart';

class Carrusel{
  final int id;
  final String src;

  Carrusel({
    required this.id,
    required this.src,
  });
  factory Carrusel.fromJson(Map<String, dynamic> json) {
    final imgBaseUrl = dotenv.env['IMG_BASE_URL'] ?? '';
    return Carrusel(
      id: json['id'] as int,
      src: '$imgBaseUrl/${json['src']}',
    );
  }
}