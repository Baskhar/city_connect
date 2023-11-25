import 'package:city_connect/app/data/models/auth_model/auth_model.dart';
import 'package:city_connect/app/data/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final IRegisterRepository repository;

  @observable
  bool loading = false;
  @observable
  bool registerError = false;
  @observable
  bool registerSuccess = false;

  _RegisterStore({
    required this.repository,
  });

  @action
  register(AuthModel user) async {
    loading = true;

    try {
      final result = await repository.register(user: user);
      registerSuccess = true;
      loading = false;
    } catch (e) {
      registerError = true;
    }
    loading = false;
    registerError = false;
    registerSuccess = false;
  }
}
