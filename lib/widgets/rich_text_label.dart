import 'package:flutter/material.dart';
import 'package:list_product/assets/colors.dart';
import 'package:list_product/assets/fonts.dart';
import 'package:list_product/assets/size.dart';

class RichTextLabel extends StatelessWidget {
  const RichTextLabel(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.maxline,
      this.font})
      : super(key: key);
  final text;
  final size, color;
  final maxline;
  final font;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxline ?? 2,
      overflow: TextOverflow.ellipsis,
      strutStyle: StrutStyle(fontSize: 11.0),
      text: TextSpan(
          style: TextStyle(
              color: color ?? ColorsApp.black,
              fontFamily: font ?? FontsApp.interRegular,
              fontSize: size ?? SizeApp.normalSize),
          text: text),
    );
  }
}
