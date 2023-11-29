import 'package:city_connect/app/modules/auth/register/screens/register_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const RegisterScreen()),
      ];
}
