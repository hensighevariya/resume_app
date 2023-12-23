import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int maxLines;
  final double? wordSpacing;
  final double? letterSpacing;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final double? height;

  const AppText({
    Key? key,
    @required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.wordSpacing,
    this.letterSpacing,
    this.fontFamily,
    this.fontStyle,
    this.decoration,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        height: height,
        fontFamily: fontFamily,
        fontSize: fontSize ?? 14.px,
        fontWeight: fontWeight,
        color: fontColor ?? ColorConstant.appBlack,
        wordSpacing: wordSpacing,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }
}
