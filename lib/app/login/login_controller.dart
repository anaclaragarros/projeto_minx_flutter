import 'package:projeto_minx_flutter/app/login/login_repository.dart';
import 'package:projeto_minx_flutter/app/model/usuario.dart';
import 'package:projeto_minx_flutter/app/model/usuario_request.dart';

class LoginController{

  final _repository = LoginRepository();

  Future<Usuario> login(String usuario, String senha) async {
    final request = UsuarioRequest(email: usuario, password: senha);
    final result = await _repository.login(request);
    return result;
  }

  Future<Usuario> cadastrar(String usuario, String senha) async {
    final request = UsuarioRequest(email: usuario, password: senha);
    final result = await _repository.createUser(request);
    return result;
  }
}