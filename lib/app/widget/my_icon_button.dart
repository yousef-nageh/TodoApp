import 'package:flutter/material.dart';
import 'package:todo_app/core/util/size_config.dart';


class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.onPressed, required this.iconData, this.color});
final VoidCallback onPressed;
 final IconData iconData;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(iconData,size: SizeConfig.getIconSize(5.2),color:color ,));
  }
}
