import 'package:doctorapp/model/ciudad_model.dart';
import 'package:doctorapp/model/especialidad_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Doctor {
  final int id;
  final String name;
  final String email;
  final int especialidadId;
  final int ciudadId;
  final String celular;
  final String avatar;
  final String horasDeTrabajo;
  final double tarifa;
  final String acerca;
  final String servicio;
  final String cuidado;
  final String direccion;
  final double lat;
  final double lng;
  final String status;
  final String role;
  final Especialidad? especialidad;
  final Ciudad? ciudad;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.especialidadId,
    required this.ciudadId,
    required this.celular,
    required this.avatar,
    required this.horasDeTrabajo,
    required this.tarifa,
    required this.acerca,
    required this.servicio,
    required this.cuidado,
    required this.direccion,
    required this.lat,
    required this.lng,
    required this.status,
    required this.role,
    this.especialidad,
    this.ciudad,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    final imgBaseUrl = dotenv.env['IMG_BASE_URL'] ?? '';
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      especialidadId: json['especialidad_id'],
      ciudadId: json['ciudad_id'],
      celular: json['celular'] ?? '',
      // avatar: json['avatar'] ?? '',
      avatar: '$imgBaseUrl/${json['avatar']}',
      horasDeTrabajo: json['horas_de_trabajo'] ?? '',
      tarifa: double.tryParse(json['tarifa'].toString()) ?? 0.0,
      acerca: json['acerca'] ?? '',
      servicio: json['servicio'] ?? '',
      cuidado: json['cuidado'] ?? '',
      direccion: json['direccion'] ?? '',
      lat: double.tryParse(json['lat'].toString()) ?? 0.0,
      lng: double.tryParse(json['lng'].toString()) ?? 0.0,
      status: json['status'] ?? '',
      role: json['role'] ?? '',
      especialidad: json['especialidad'] != null
          ? Especialidad.fromJson(json['especialidad'])
          : null,

      ciudad: json['ciudad'] != null
          ? Ciudad.fromJson(json['ciudad'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'especialidad_id': especialidadId,
      'ciudad_id': ciudadId,
      'celular': celular,
      'avatar': avatar,
      'horas_de_trabajo': horasDeTrabajo,
      'tarifa': tarifa,
      'acerca': acerca,
      'servicio': servicio,
      'cuidado': cuidado,
      'direccion': direccion,
      'lat': lat,
      'lng': lng,
      'status': status,
      'role': role,
      'especialidad': especialidad?.toJson(),
      'ciudad': ciudad?.toJson(),
    };
  }
}