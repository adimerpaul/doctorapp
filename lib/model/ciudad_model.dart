class Ciudad {
  final int id;
  final String nombre;

  Ciudad({required this.id, required this.nombre});

  factory Ciudad.fromJson(Map<String, dynamic> json) {
    return Ciudad(
      id: json['id'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}