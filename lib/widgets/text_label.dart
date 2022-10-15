import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:list_product/assets/colors.dart';
import 'package:list_product/assets/fonts.dart';
import 'package:list_product/assets/size.dart';

class TextLabel extends StatelessWidget {
  TextLabel({super.key, required this.text, this.color, this.font, this.size});
  final text;
  final color;
  final font;
  final size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? ColorsApp.black,
          fontFamily: font ?? FontsApp.interRegular,
          fontSize: size ?? SizeApp.normalSize
          ),
    );
  }
}
