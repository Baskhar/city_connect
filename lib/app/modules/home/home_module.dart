import 'package:city_connect/app/data/token/token.dart';
import 'package:city_connect/app/modules/home/screens/home_screen.dart';
import 'package:city_connect/app/modules/home/screens/estabelecimento_screen.dart';

import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Token()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomeScreen()),
        ChildRoute('/estabelecimento',
            child: (_, __) => EstabelecimentoScreen()),
      //   ChildRoute('/hotel_soft_win', child: (_, __) => SoftWinHotelScreen()),
      // //  ChildRoute('/hotel_luzeiros', child: (_, __) => LuzeirosHotelScreen()),
      //   ChildRoute('/restaurante_coco_bambu',
      //       child: (_, __) => CocoBambuScreen()),
      //   ChildRoute('/restaurante_cabana_do_sol',
      //       child: (_, __) => CabanaDoSolScreen()),
      //   ChildRoute('/pontos_litoranea', child: (_, __) => LitoraneaScreen()),
      //   ChildRoute('/pontos_praca_gd', child: (_, __) => PracaGdScreen()),
      ];
}
