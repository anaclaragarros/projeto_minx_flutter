class UsuarioRequest {
  final String email;
  final String password;

  const UsuarioRequest({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() => {
    "nome": email,
    "email": email,
    "senha": password
  };

}
