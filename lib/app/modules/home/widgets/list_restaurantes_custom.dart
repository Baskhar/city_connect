import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../../constants/app_colors.dart';

class ListRestaurantesCustom extends StatelessWidget {
  final String text_restau1;
  final String img_restau1;
  final String text_restau2;
  final String img_restau2;

  ListRestaurantesCustom(
      {super.key,
        required this.text_restau1,
        required this.img_restau1,
        required this.text_restau2,
        required this.img_restau2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Modular.to.pushNamed('/home/restaurante_coco_bambu');
          },
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: AppColors.white
                  ),
                  image: DecorationImage(

                      image: AssetImage(img_restau1), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Text(
                    text_restau1,
                    style: TextStyle(
                      fontFamily: 'Borel',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        InkWell(
          onTap: (){
            Modular.to.pushNamed('/home/restaurante_cabana_do_sol');

          },
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: AppColors.white
                  ),
                  image: DecorationImage(
                      image: AssetImage(img_restau2), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Text(
                    text_restau2,
                    style: TextStyle(
                      fontFamily: 'Borel',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
