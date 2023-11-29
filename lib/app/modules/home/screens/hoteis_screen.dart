import 'package:city_connect/app/data/models/estabelcimento/estabelcimento_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../widgets/list_estabelecimentos_custom.dart';

class HoteisScreen extends StatelessWidget {
  final List<EstabelecimentoModel> estabelecimentos;

  const HoteisScreen({Key? key, required this.estabelecimentos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundHoteis),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Defina o número de colunas desejado
            crossAxisSpacing:
                16.0, // Adicione espaçamento horizontal entre os itens
            mainAxisSpacing:
                16.0, // Adicione espaçamento vertical entre os itens
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
