import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../../constants/app_colors.dart';

class ListHotelCustom extends StatelessWidget {
  final String text_hotel1;
  final String img_hotel1;
  final String text_hotel2;
  final String img_hotel2;

  ListHotelCustom(
      {super.key,
      required this.text_hotel1,
      required this.img_hotel1,
      required this.text_hotel2,
      required this.img_hotel2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Modular.to.pushNamed('/home/hotel_soft_win');
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

                      image: AssetImage(img_hotel1), fit: BoxFit.cover),
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
                    text_hotel1,
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
            Modular.to.pushNamed('/home/hotel_luzeiros');

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
                image: AssetImage(img_hotel2), fit: BoxFit.cover),
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
                    text_hotel2,
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
