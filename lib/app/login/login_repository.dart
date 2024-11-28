import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_minx_flutter/app/model/usuario.dart';
import 'package:projeto_minx_flutter/app/model/usuario_request.dart';

class LoginRepository {
  final _dio = Dio();

  Future<Usuario> createUser(UsuarioRequest usuario) async {
    final result = await _dio.post(
      "http://127.0.0.1:8000/api/create/usuario",
      data: usuario.toMap(),
    );

    return Usuario.fromMap(result.data);
  }

  Future<Usuario> login(UsuarioRequest usuario) async {
    final result = await _dio.post(
      "http://127.0.0.1:8000/api/login",
      data: usuario.toMap(),
    );
    return Usuario.fromMap(result.data);
  }
}
