
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../widgets/drawer.dart';
import '../widgets/list_hotel_custom.dart';

class HoteisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      // ),
      //drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundHoteis), fit: BoxFit.cover),

        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ListHotelCustom(img_hotel1: AppImages.backgroundHoteis,text_hotel1: 'Soft Win Hotel',img_hotel2: AppImages.backgroundImgLuzeiros,text_hotel2: 'Luzeiros Hotel'),
          ],
        ),
      ),
    );
  }
}