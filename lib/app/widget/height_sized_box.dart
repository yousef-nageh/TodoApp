import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/config/extension.dart';

class HeightSizedBox extends StatelessWidget {
  const HeightSizedBox({super.key, required this.height});
final double height;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:height.h(),
    );
  }
}
