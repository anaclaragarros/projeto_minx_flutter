class Post{
  final int id;
  final int idUsuario;
  final String titulo;
  final String conteudo;
  final DateTime dataCriacao;

  const Post({
    required this.id,
    required this.idUsuario,
    required this.titulo,
    required this.conteudo,
    required this.dataCriacao,
});

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map["id"],
      idUsuario: map["usuario"],
      titulo: map["titulo"],
      conteudo: map["conteudo"],
      dataCriacao: DateTime.parse(map["data_criacao"]),
    );
  }
}