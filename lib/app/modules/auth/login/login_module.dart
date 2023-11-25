

import 'package:city_connect/app/modules/auth/login/screens/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';




class LoginModule extends Module {
  @override
  List<Bind> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const LoginScreen()),
  ];
}