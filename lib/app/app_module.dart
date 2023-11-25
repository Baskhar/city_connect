import 'package:city_connect/app/modules/auth/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/login/login_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login/', module: LoginModule()),
        ModuleRoute('/home/', module: HomeModule()),
        ModuleRoute('/register/', module: RegisterModule())
      ];
}
