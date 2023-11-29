// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:city_connect/app/data/models/auth_model/login_model.dart';

import 'package:mobx/mobx.dart';

import 'package:city_connect/app/data/repositories/auth_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final ILoginRepository repository;

  @observable
  @observable
  bool loading = false;
  @observable
  bool loginError = false;
  @observable
  bool loginSucess = false;
  _LoginStore({
    required this.repository,
  });

  @action
  login({required LoginModel login}) async {
    loading = true;

    try {
      final result = await repository.login(login: login);

      loading = false;
      loginSucess = true;
      //loading = false;
    } catch (e) {
      print('Erro durante a requisição HTTP: $e');
      loginError = true;
    }
    loading = false;
    loginError = false;
    // loginSucess = false;
  }
}
