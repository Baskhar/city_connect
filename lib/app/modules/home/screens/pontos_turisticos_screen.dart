import 'package:city_connect/app/modules/home/widgets/list_pontos_custom.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../widgets/list_hotel_custom.dart';
import '../widgets/list_restaurantes_custom.dart';

class PontosTuristicosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundPontosTuristicos), fit: BoxFit.cover),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ListPontosCustom(text_pontos1: 'Litorânea', img_pontos1: AppImages.backgroundLitoranea, text_pontos2: 'Praça Gonçalves Dias', img_pontos2: AppImages.backgroundImgGoncalvesDias),
          ],
        ),
      ),
    );
  }
}