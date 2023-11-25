import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomTextFormFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String validatorMessage;
  final TextInputType? keyboardType;
  const CustomTextFormFieldLogin({
    super.key,
    required this.controller,
    required this.hint,
    required this.validatorMessage,
    this.keyboardType,
  });

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
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold)),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return validatorMessage;
            }
            return null;
          },
        ),
      ),
    );
  }
}
