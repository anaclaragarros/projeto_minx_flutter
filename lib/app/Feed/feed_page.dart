import 'package:flutter/material.dart';
import 'package:projeto_minx_flutter/app/Feed/feed_controller.dart';
import 'package:projeto_minx_flutter/app/model/post.dart';
import 'package:projeto_minx_flutter/app/model/usuario.dart';

class FeedPage extends StatefulWidget {

  final Usuario usuario;

  const FeedPage({super.key,required this.usuario});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final controller = FeedController();

  List<Post> posts = [];

  Future<void> getAllPosts() async {
    final result = await controller.getAllPost();
    posts = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed ${widget.usuario.name}"),
      ),
      body: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.titulo),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(post.conteudo),
                Text(post.dataCriacao.toString()),
                Text("id usuario de criacao ${post.idUsuario}")
              ],
            ),
          );
        },
      ),
    );
  }
}
