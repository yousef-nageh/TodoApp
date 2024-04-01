import 'package:flutter/material.dart';
import 'package:todo_app/core/config/extension.dart';

import '../../core/util/app_string.dart';

class MYTextFormField extends StatelessWidget {
  const MYTextFormField(
      {super.key,

      required this.iconData,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.keyboardType,
        this.noTap,

      this.onChanged});

  final VoidCallback? noTap;
  final IconData iconData;
  final String hintText;

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: noTap,
      validator: (String ? value){

          if(value?.isEmpty==true){
            return AppString.validatorTest.tr(context);
          }
          return null;
        },

      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: hintText.tr(context),
        labelText: labelText.tr(context),
      ),
    );
  }
}
