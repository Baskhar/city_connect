// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:city_connect/app/data/models/idUSer/id_user.dart';
import 'package:http/http.dart' as http;
import 'package:city_connect/app/constants/app_services.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/models/auth_model/auth_model.dart';
import 'package:city_connect/app/data/models/auth_model/login_model.dart';
import 'package:city_connect/app/data/models/user/user_model.dart';
import 'package:city_connect/app/data/token/token.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ILoginRepository {
  Future<Map<String, dynamic>> login({required LoginModel login});
}

abstract class IRegisterRepository {
  Future<void> register({required AuthModel user});
}

class AuthRepository implements ILoginRepository, IRegisterRepository {
  final IhttpCliente cliente;
  Token? token;
  UserId? userId;
  AuthRepository({
    required this.cliente,
  }) {
    token = Modular.get<Token>();
    userId = Modular.get<UserId>();
  }

  @override
  Future<Map<String, dynamic>> login({required LoginModel login}) async {
    final response =
        await cliente.post(url: AppServices.baseUrl + AppServices.LOGIN, body: {
      'email': login.email,
      'password': login.password,
    });

    if (response.statusCode == 200) {
      // Converta o JSON retornado para um mapa
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Acesse os valores das chaves 'idUsuario' e 'token'
      int idUsuario = responseData['idUsuario'];
      String stringToken = responseData['token'];

      // Use as instâncias de Token e UserId para armazenar os valores
      token?.setToken(stringToken);
      userId?.setUserId(idUsuario);

      // Retorna o mapa com os valores
      return {'idUsuario': idUsuario, 'token': stringToken};
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Não foi possível fazer login');
    }
  }

  @override
  Future<void> register({required AuthModel user}) async {
    final response = await cliente.post(
      url: AppServices.baseUrl + AppServices.REGISTER,
      body: {
        'nome': user.nome,
        'email': user.email,
        'password': user.password,
      },
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('teste2');
      print('Cadastro Realizado com sucesso');
    } else {
      throw Exception('Failed to register user');
    }
  }
}
