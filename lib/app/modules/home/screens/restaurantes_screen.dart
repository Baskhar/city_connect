import 'package:city_connect/app/modules/home/widgets/list_estabelecimentos_custom.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../../data/models/estabelcimento/estabelcimento_model.dart';
import '../widgets/list_restaurantes_custom.dart';

class RestaurantesScreen extends StatelessWidget {
  final List<EstabelecimentoModel> estabelecimentos;

  const RestaurantesScreen({Key? key, required this.estabelecimentos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundRestaurantes),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: estabelecimentos.length,
          itemBuilder: (context, index) {
            final estabelecimento = estabelecimentos[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ListEstabelecimentosCustom(
                estabelecimento: estabelecimento,
                onTap: (estabelecimento) {
                  Navigator.pushNamed(
                    context,
                    '/home/estabelecimento',
                    arguments: estabelecimento.id,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
