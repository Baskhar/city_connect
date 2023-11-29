import 'package:city_connect/app/data/models/estabelcimento/estabelcimento_model.dart';
import 'package:city_connect/app/modules/home/widgets/list_estabelecimentos_custom.dart';
import 'package:city_connect/app/modules/home/widgets/list_pontos_custom.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';

class PontosTuristicosScreen extends StatelessWidget {
  final List<EstabelecimentoModel> estabelecimentos;

  const PontosTuristicosScreen({super.key, required this.estabelecimentos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundPontosTuristicos),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: (estabelecimentos.length / 2).ceil(),
          itemBuilder: (context, index) {
            final startIndex = index * 2;
            final endIndex = startIndex + 2;
            final currentEstabelecimentos = estabelecimentos.sublist(
                startIndex, endIndex.clamp(0, estabelecimentos.length));

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
              child: ListEstabelecimentosCustom(
                estabelecimentos: currentEstabelecimentos,
                onTap: (estabelecimento) {
                  // Implemente a navegação ou ação desejada aqui
                  // Passar o ID para a próxima tela
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
