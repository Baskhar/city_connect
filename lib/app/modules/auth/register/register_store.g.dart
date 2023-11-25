// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  late final _$loadingAtom =
      Atom(name: '_RegisterStore.loading', context: context);

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

  late final _$registerErrorAtom =
      Atom(name: '_RegisterStore.registerError', context: context);

  @override
  bool get registerError {
    _$registerErrorAtom.reportRead();
    return super.registerError;
  }

  @override
  set registerError(bool value) {
    _$registerErrorAtom.reportWrite(value, super.registerError, () {
      super.registerError = value;
    });
  }

  late final _$registerSuccessAtom =
      Atom(name: '_RegisterStore.registerSuccess', context: context);

  @override
  bool get registerSuccess {
    _$registerSuccessAtom.reportRead();
    return super.registerSuccess;
  }

  @override
  set registerSuccess(bool value) {
    _$registerSuccessAtom.reportWrite(value, super.registerSuccess, () {
      super.registerSuccess = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterStore.register', context: context);

  @override
  Future register(AuthModel user) {
    return _$registerAsyncAction.run(() => super.register(user));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
registerError: ${registerError},
registerSuccess: ${registerSuccess}
    ''';
  }
}
