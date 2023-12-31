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
  register({required AuthModel user}) async {
    loading = true;

    try {
      final result = await repository.register(user: user);
      loading = false;
      registerSuccess = true;
    } catch (e) {
      registerError = true;
    }
    loading = false;
    registerError = false;
    //registerSuccess = false;
  }
}
