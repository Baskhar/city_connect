import 'package:city_connect/app/constants/app_images.dart';
import 'package:flutter/material.dart';

class MyContainerLoginCustom extends StatelessWidget {
  final Widget child;
  MyContainerLoginCustom({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    return Container(
      width: largura,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.backgroundLogin), fit: BoxFit.cover),

      ),
      child: child,
    );
  }
}
