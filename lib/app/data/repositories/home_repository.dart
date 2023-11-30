import 'dart:convert';

import 'package:city_connect/app/constants/app_services.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/models/estabelcimento/estabelcimento_model.dart';
import 'package:city_connect/app/data/models/images_model/images_model.dart';

abstract class IEstabelecimentosRepository {
  Future<List<EstabelecimentoModel>> listEstabelecimentos();
  Future<EstabelecimentoModel> estabelecimento({required int id});
  Future<List<ImagesModel>> listImages({required int id});
  Future<EstabelecimentoModel> enviarComentario({
    required int usuarioId,
    required int estabelecimentoId,
    required String comentario,
  });
}

class EstabelcimentosRepository implements IEstabelecimentosRepository {
  final IhttpCliente cliente;
  EstabelcimentosRepository({
    required this.cliente,
  });

  @override
  Future<List<EstabelecimentoModel>> listEstabelecimentos() async {
    final response = await cliente.get(
      url: AppServices.baseUrl + AppServices.LISTESTABELECIMENTOS,
    );

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> responseData = jsonDecode(
        Utf8Decoder().convert(response.bodyBytes),
      );

      // Mapeie cada item da lista para um EstabelecimentoModel
      List<EstabelecimentoModel> estabelecimentos = responseData
          .map((item) => EstabelecimentoModel.fromMap(item))
          .toList();

      return estabelecimentos;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Não foi possível obter a lista de estabelecimentos');
    }
  }

  @override
  Future<EstabelecimentoModel> estabelecimento({required int id}) async {
    final response = await cliente.get(
      url:
          AppServices.baseUrl + AppServices.LISTESTABELECIMENTO + id.toString(),
    );

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> responseData = jsonDecode(
        Utf8Decoder().convert(response.bodyBytes),
      );

      // Crie um único EstabelecimentoModel
      EstabelecimentoModel estabelecimento =
          EstabelecimentoModel.fromMap(responseData);

      return estabelecimento;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Não foi possível obter o estabelecimento');
    }
  }

  @override
  Future<List<ImagesModel>> listImages({required int id}) async {
    final response = await cliente.get(
      url: AppServices.baseUrl +
          AppServices.LISTESTABELECIMENTO +
          id.toString() +
          '/fotos-ambiente',
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(
        Utf8Decoder().convert(response.bodyBytes),
      );

      // Mapeie cada item da lista para um ImagesModel
      List<ImagesModel> images =
          responseData.map((item) => ImagesModel.fromMap(item)).toList();

      return images;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Não foi possível obter as fotos do estabelecimento');
    }
  }

  @override
  Future<EstabelecimentoModel> enviarComentario(
      {required int usuarioId,
      required int estabelecimentoId,
      required String comentario}) async {
    final response = await cliente
        .post(url: AppServices.baseUrl + AppServices.AVALIACOES, body: {
      'usuarioId': usuarioId,
      'estabelecimentoId': estabelecimentoId,
      'comentario': comentario,
    });

    if (response.statusCode == 201) {
      print(response.body);
      Map<String, dynamic> responseData = jsonDecode(
        Utf8Decoder().convert(response.bodyBytes),
      );

      // Crie um único EstabelecimentoModel
      EstabelecimentoModel estabelecimento =
          EstabelecimentoModel.fromMap(responseData);

      return estabelecimento;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Não foi possível obter enviar comentário');
    }
  }
}
