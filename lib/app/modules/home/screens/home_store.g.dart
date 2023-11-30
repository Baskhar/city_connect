// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$currentEstabelecimentoAtom =
      Atom(name: '_HomeStore.currentEstabelecimento', context: context);

  @override
  EstabelecimentoModel? get currentEstabelecimento {
    _$currentEstabelecimentoAtom.reportRead();
    return super.currentEstabelecimento;
  }

  @override
  set currentEstabelecimento(EstabelecimentoModel? value) {
    _$currentEstabelecimentoAtom
        .reportWrite(value, super.currentEstabelecimento, () {
      super.currentEstabelecimento = value;
    });
  }

  late final _$getImageAtom =
      Atom(name: '_HomeStore.getImage', context: context);

  @override
  List<ImagesModel>? get getImage {
    _$getImageAtom.reportRead();
    return super.getImage;
  }

  @override
  set getImage(List<ImagesModel>? value) {
    _$getImageAtom.reportWrite(value, super.getImage, () {
      super.getImage = value;
    });
  }

  late final _$loadingAtom = Atom(name: '_HomeStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_HomeStore.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$sucessAtom = Atom(name: '_HomeStore.sucess', context: context);

  @override
  bool get sucess {
    _$sucessAtom.reportRead();
    return super.sucess;
  }

  @override
  set sucess(bool value) {
    _$sucessAtom.reportWrite(value, super.sucess, () {
      super.sucess = value;
    });
  }

  late final _$estabelecimentosAtom =
      Atom(name: '_HomeStore.estabelecimentos', context: context);

  @override
  ObservableList<EstabelecimentoModel> get estabelecimentos {
    _$estabelecimentosAtom.reportRead();
    return super.estabelecimentos;
  }

  @override
  set estabelecimentos(ObservableList<EstabelecimentoModel> value) {
    _$estabelecimentosAtom.reportWrite(value, super.estabelecimentos, () {
      super.estabelecimentos = value;
    });
  }

  late final _$listEstabecimentosAsyncAction =
      AsyncAction('_HomeStore.listEstabecimentos', context: context);

  @override
  Future listEstabecimentos() {
    return _$listEstabecimentosAsyncAction
        .run(() => super.listEstabecimentos());
  }

  late final _$loadEstabelecimentoAsyncAction =
      AsyncAction('_HomeStore.loadEstabelecimento', context: context);

  @override
  Future loadEstabelecimento(int id) {
    return _$loadEstabelecimentoAsyncAction
        .run(() => super.loadEstabelecimento(id));
  }

  late final _$loadImagesAsyncAction =
      AsyncAction('_HomeStore.loadImages', context: context);

  @override
  Future loadImages(int id) {
    return _$loadImagesAsyncAction.run(() => super.loadImages(id));
  }

  late final _$enviarComentarioAsyncAction =
      AsyncAction('_HomeStore.enviarComentario', context: context);

  @override
  Future enviarComentario(
      {required int usuarioId,
      required int estabelecimentoId,
      required String comentario}) {
    return _$enviarComentarioAsyncAction.run(() => super.enviarComentario(
        usuarioId: usuarioId,
        estabelecimentoId: estabelecimentoId,
        comentario: comentario));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void addEstabelecimentos(List<EstabelecimentoModel> newEstabelecimentos) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.addEstabelecimentos');
    try {
      return super.addEstabelecimentos(newEstabelecimentos);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentEstabelecimento: ${currentEstabelecimento},
getImage: ${getImage},
loading: ${loading},
error: ${error},
sucess: ${sucess},
estabelecimentos: ${estabelecimentos}
    ''';
  }
}
