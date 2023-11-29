// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$loadingAtom =
      Atom(name: '_LoginStore.loading', context: context);

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

  late final _$loginErrorAtom =
      Atom(name: '_LoginStore.loginError', context: context);

  @override
  bool get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(bool value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  late final _$loginSucessAtom =
      Atom(name: '_LoginStore.loginSucess', context: context);

  @override
  bool get loginSucess {
    _$loginSucessAtom.reportRead();
    return super.loginSucess;
  }

  @override
  set loginSucess(bool value) {
    _$loginSucessAtom.reportWrite(value, super.loginSucess, () {
      super.loginSucess = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStore.login', context: context);

  @override
  Future login({required LoginModel login}) {
    return _$loginAsyncAction.run(() => super.login(login: login));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loginError: ${loginError},
loginSucess: ${loginSucess}
    ''';
  }
}
