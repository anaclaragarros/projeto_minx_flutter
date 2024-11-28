import 'package:flutter/material.dart';
import 'package:projeto_minx_flutter/app/Feed/feed_page.dart';
import 'package:projeto_minx_flutter/app/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> cadastrar() async {
    try {
      final result = await loginController.cadastrar(
          _usuarioController.text, _senhaController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return  FeedPage(usuario: result);
          },
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao cadastrar usuario"),
        ),
      );
    }
  }

  Future<void> logar() async {
    try {
      final result = await loginController.login(
          _usuarioController.text, _senhaController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return FeedPage(usuario: result);
          },
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Usuario ou senha invalido"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Minx'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const Text("Usuário"),
                TextFormField(
                  validator: (value) {
                    if (value == null) return "email não pode ser vazio";
                    if (value.isEmpty) return "email não pode ser vazio";
                    if (!value.contains("@")) return "email invalido";
                    return null;
                  },
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite seu usuário",
                  ),
                ),
                const SizedBox(height: 12),
                const Text("Senha"),
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite sua senha",
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: logar,
                  child: const Text("Login"),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: cadastrar,
                    child: const Text("Cadastrar-se"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
