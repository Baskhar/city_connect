import 'dart:convert';

import 'package:city_connect/app/data/token/token.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

abstract class IhttpCliente {
  Future get({required String url});
  Future post({
    required String url,
    dynamic body,
  });
}

class HttpCliente implements IhttpCliente {
  final http.Client client = http.Client();
  final Token? token;

  HttpCliente({this.token});

  Future<Map<String, String>> getHeaders() async {
    final tokenValue = await token?.getToken() ?? '';
    return tokenValue.isEmpty
        ? {'Content-Type': 'application/json;charset=utf-8'}
        : {
            'Content-Type': 'application/json;charset=utf-8',
            'Authorization': 'Bearer $tokenValue',
          };
  }

  @override
  Future get({required String url}) async {
    final headers = await getHeaders();
    return await client.get(Uri.parse(url), headers: headers);
  }

  @override
  Future post({required String url, dynamic body}) async {
    final headers = await getHeaders();
    try {
      final response = await client.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      return response;
    } catch (e) {
      print('Erro durante a requisição: $e');
      // Trate a exceção conforme necessário
    }
  }
}
