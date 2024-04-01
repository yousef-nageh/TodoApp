import 'package:flutter/material.dart';

class MYTextButton extends StatelessWidget {
  const MYTextButton({super.key, required this.onPressed, required this.text, this.textColor});
final VoidCallback onPressed;
final String text;
final  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: textColor,
    ), child: Text(text),
    );
  }
}
