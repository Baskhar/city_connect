import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';

class SetaBack extends StatelessWidget {
  const SetaBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Modular.to.pop();
        },
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.img_seta_back,
                    width: 24,
                    height: 24,
                  ),
                ))));
  }
}
