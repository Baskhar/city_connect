import 'package:flutter/material.dart';

class CustomLoadButton extends StatefulWidget {
  final String? title;

  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool? loading;
  final VoidCallback? onClick;

  CustomLoadButton({
    Key? key,
    this.title,

    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.loading,
    this.onClick,
  }) : super(key: key);

  @override
  _CustomLoadButtonState createState() => _CustomLoadButtonState();
}

class _CustomLoadButtonState extends State<CustomLoadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.loading! ? null : widget.onClick,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: Colors.black),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            widget.buttonColor ?? Colors.blue, // Defina a cor padrão para o botão
          ),
        ),
        child: widget.loading!
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 3,
          ),
        )
            : Text(
          widget.title!,
          style: TextStyle(
            fontSize: 16,
            color: widget.textColor ?? Colors.white, // Defina a cor padrão para o texto
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
