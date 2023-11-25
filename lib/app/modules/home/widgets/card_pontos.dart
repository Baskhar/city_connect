import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CardPontos extends StatefulWidget {
  final String title;

  const CardPontos({Key? key, required this.title}) : super(key: key);

  @override
  _CardPontosState createState() => _CardPontosState();
}

class _CardPontosState extends State<CardPontos> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.black : AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Borel',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _isSelected ? AppColors.white : AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}