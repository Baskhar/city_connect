// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:city_connect/app/data/models/images_model/images_model.dart';
import 'package:city_connect/app/data/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:city_connect/app/data/repositories/auth_repository.dart';
import '../../../data/models/estabelcimento/estabelcimento_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final IEstabelecimentosRepository repository;

  @observable
  EstabelecimentoModel? currentEstabelecimento;

  @observable
  List<ImagesModel>? getImage;

  @observable
  bool loading = false;

  @observable
  bool error = false;

  @observable
  bool sucess = false;

  _HomeStore({
    required this.repository,
  });

  @action
  listEstabecimentos() async {
    loading = true;

    try {
      final result = await repository.listEstabelecimentos();
      addEstabelecimentos(result); // Adiciona os estabelecimentos à lista
      loading = false;
      sucess = true;
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
      loading = false;
      error = true;
    }
    loading = false;
    error = false;
  }

  @observable
  ObservableList<EstabelecimentoModel> estabelecimentos = ObservableList();

  @action
  void addEstabelecimentos(List<EstabelecimentoModel> newEstabelecimentos) {
    estabelecimentos
        .clear(); // Limpa a lista antes de adicionar novos estabelecimentos
    estabelecimentos
        .addAll(newEstabelecimentos); // Adiciona os novos estabelecimentos
  }

  List<EstabelecimentoModel> filterEstabelecimentosByType(String tipo) {
    return estabelecimentos
        .where((estabelecimento) => estabelecimento.tipo == tipo)
        .toList();
  }

  @action
  loadEstabelecimento(int id) async {
    loading = true;

    try {
      final result = await repository.estabelecimento(id: id);
      currentEstabelecimento = result;
      // Adicione a lógica para lidar com o estabelecimento individual, se necessário
      // Você pode armazenar o estabelecimento em uma variável observável ou fazer outra coisa com ele.
      // Chama o método para obter as imagens associadas ao estabelecimento

      loading = false;
      sucess = true;
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
      loading = false;
      error = true;
    }
    loading = false;
    error = false;
  }

  @action
  loadImages(int id) async {
    loading = true;
    try {
      final imagesResult = await repository.listImages(id: id);
      getImage = imagesResult;
      loading = false;
      sucess = true;
      //return imagesResult.base64Data;
    } catch (e) {
      print('Erro ao carregar imagens: $e');
      loading = false;
      error = true;
      // Você pode manipular o erro conforme necessário
    }
    loading = false;
    error = false;
  }

  @action
  enviarComentario({
    required int usuarioId,
    required int estabelecimentoId,
    required String comentario,
  }) async {
    loading = true;

    try {
      final result = await repository.enviarComentario(
        usuarioId: usuarioId,
        estabelecimentoId: estabelecimentoId,
        comentario: comentario,
      );
      // Atualiza o currentEstabelecimento com os dados mais recentes
      currentEstabelecimento = result;
      loading = false;
      sucess = true;
    } catch (e) {
      print('Erro durante o envio de comentário: $e');
      loading = false;
      error = true;
    }
    loading = false;
    error = false;
  }
}
