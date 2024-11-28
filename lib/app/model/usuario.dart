class Usuario {
  final int id;
  final String name;
  final String email;

  const Usuario({
    required this.name,
    required this.id,
    required this.email,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map["id"],
      name: map["nome"],
      email: map["email"],
    );
  }
}
