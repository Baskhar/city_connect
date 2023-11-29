import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants/app_colors.dart';
import '../../../data/models/estabelcimento/estabelcimento_model.dart';

class ListEstabelecimentosCustom extends StatelessWidget {
  final EstabelecimentoModel estabelecimento;
  final Function(EstabelecimentoModel)? onTap;

  ListEstabelecimentosCustom({
    Key? key,
    required this.estabelecimento,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(estabelecimento);
      },
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.white),
                image: DecorationImage(
                  image: Image.memory(
                          Uint8List.fromList(estabelecimento.fotoPerfil))
                      .image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  estabelecimento.nome,
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
          ),
        ],
      ),
    );
  }
}
