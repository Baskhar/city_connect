import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../widgets/list_restaurantes_custom.dart';

class RestaurantesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundRestaurantes), fit: BoxFit.cover),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListRestaurantesCustom(img_restau1: AppImages.backgroundImgCocoBambu,text_restau1: 'Coco Bambu',img_restau2: AppImages.backgroundImgCabanaDoSol,text_restau2: 'Cabana do sol'),
          ],
        ),
      ),
    );
  }
}
