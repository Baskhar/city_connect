import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomTextFormFieldLogin extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String validatorMessage;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  bool? obscureText; // Adicionei a propriedade aqui
  final VoidCallback? onSuffixIconPressed;

  // Atualizei o construtor para aceitar a nova propriedade
  CustomTextFormFieldLogin({
    Key? key,
    required this.controller,
    required this.hint,
    required this.validatorMessage,
    this.suffixIcon,
    this.obscureText, // Definido um valor padrão
    this.keyboardType,
    this.onSuffixIconPressed,
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
                obscureText: widget.obscureText ??
                    false, // Use a propriedade diretamente aqui
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: widget.suffixIcon != null
                      ? IconButton(
                          onPressed: widget.onSuffixIconPressed,
                          icon: Icon(
                            widget.suffixIcon!,
                            color: Colors.black,
                          ),
                        )
                      : null,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return widget.validatorMessage;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
