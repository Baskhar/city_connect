import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomTextFormFieldLogin extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String validatorMessage;
  final TextInputType? keyboardType;
  bool obscureText; // Adicionei a propriedade aqui

  // Atualizei o construtor para aceitar a nova propriedade
  CustomTextFormFieldLogin({
    Key? key,
    required this.controller,
    required this.hint,
    required this.validatorMessage,
    this.obscureText = false, // Definido um valor padrão
    this.keyboardType,
  }) : super(key: key);

  @override
  _CustomTextFormFieldLoginState createState() =>
      _CustomTextFormFieldLoginState();
}

class _CustomTextFormFieldLoginState extends State<CustomTextFormFieldLogin> {
  bool notShowText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                obscureText: notShowText, // Use a propriedade diretamente aqui
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return widget.validatorMessage;
                  }
                  return null;
                },
              ),
            ),
            if (widget
                .obscureText) // Mostra o ícone apenas se obscureText for verdadeiro
              IconButton(
                onPressed: () {
                  setState(() {
                    notShowText = !notShowText;
                  });
                },
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.black,
                ),
              )
          ],
        ),
      ),
    );
  }
}
