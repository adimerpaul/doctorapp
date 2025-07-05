class Especialidad {
  final int id;
  final String img;
  final String nombre;

  Especialidad({required this.id, required this.img, required this.nombre});

  factory Especialidad.fromJson(Map<String, dynamic> json) {
    return Especialidad(
      id: json['id'],
      img: json['img'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'nombre': nombre,
    };
  }
}