// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/models/auth_model/auth_model.dart';
import 'package:city_connect/app/data/models/user/user_model.dart';

abstract class ILoginRepository {
  Future<String> login();
}

abstract class IRegisterRepository {
  Future<AuthModel> register({required AuthModel user});
}

class AuthRepository implements ILoginRepository, IRegisterRepository {
  final IhttpCliente cliente;
  AuthRepository({
    required this.cliente,
  });

  @override
  Future<String> login() async {
    final response = await cliente.get(url: 'http://localhost:8181/usuarios');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final userModel = UserModel.fromMap(data);
      return userModel
          .nome; // ou userModel.token, dependendo do que você deseja retornar
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Future<AuthModel> register({required AuthModel user}) async {
    final response = await cliente.post(
      url: 'http://localhost:8181/register',
      body: {
        'email': user.email,
        'password': user.password,
        'nome': user.nome,
      },
    );
    if (response.statusCode == 200) {
      print('Cadastro Realizado com sucesso');
      final Map<String, dynamic> data = jsonDecode(response.body);
      return AuthModel.fromMap(data);
      //return null;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
