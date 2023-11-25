import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../../constants/app_colors.dart';

class ListPontosCustom extends StatelessWidget {
  final String text_pontos1;
  final String img_pontos1;
  final String text_pontos2;
  final String img_pontos2;

  ListPontosCustom(
      {super.key,
        required this.text_pontos1,
        required this.img_pontos1,
        required this.text_pontos2,
        required this.img_pontos2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Modular.to.pushNamed('/home/pontos_litoranea');
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

                      image: AssetImage(img_pontos1), fit: BoxFit.cover),
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
                    text_pontos1,
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
            Modular.to.pushNamed('/home/pontos_praca_gd');

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
                      image: AssetImage(img_pontos2), fit: BoxFit.cover),
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
                    text_pontos2,
                    style: TextStyle(
                      fontFamily: 'Borel',
                      fontSize: 13,
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
