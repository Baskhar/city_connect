// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:city_connect/app/constants/app_services.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/models/auth_model/auth_model.dart';
import 'package:city_connect/app/data/models/auth_model/login_model.dart';
import 'package:city_connect/app/data/models/user/user_model.dart';
import 'package:city_connect/app/data/token/token.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ILoginRepository {
  Future<String> login({required LoginModel login});
}

abstract class IRegisterRepository {
  Future<void> register({required AuthModel user});
}

class AuthRepository implements ILoginRepository, IRegisterRepository {
  final IhttpCliente cliente;
  Token? token;
  AuthRepository({
    required this.cliente,
  });

  @override
  Future<String> login({required LoginModel login}) async {
    final response =
        await cliente.post(url: AppServices.baseUrl + AppServices.LOGIN, body: {
      'email': login.email,
      'password': login.password,
    });

    if (response.statusCode == 200) {
      Token token = Modular.get<Token>();

      // Converta o JSON retornado para um mapa
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Acesse o valor da chave 'token'
      String stringToken = responseData['token'];

      token.setToken(stringToken);
      print(stringToken);
      return stringToken;
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
      // final Map<String, dynamic> data = jsonDecode(response.body);
      // return AuthModel.fromMap(data);
      //return null;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
