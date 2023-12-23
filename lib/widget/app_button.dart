import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';

class AppButton extends StatelessWidget {
  final Widget widget;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final double? width;
  final Function()? onTap;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderWidth;

  const AppButton({
    Key? key,
    required this.widget,
    this.color,
    this.borderColor,
    this.height,
    this.width,
    this.onTap,
    this.alignment,
    this.padding,
    this.margin,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: borderColor ?? ColorConstant.appWhite,
              width: borderWidth ?? 2.px),
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget,
      ),
    );
  }
}
