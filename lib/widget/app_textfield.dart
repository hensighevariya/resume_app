import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:resume_app/constant/color_constant.dart';
import 'package:resume_app/widget/app_text.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final Color? enableBorderColor;
  final Color? focusedBorder;
  final int? maxLines;

  const AppTextField({
    Key? key,
    this.title,
    this.onTap,
    this.controller,
    this.readOnly = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.hintText,
    this.hintStyle,
    this.style,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.contentPadding,
    this.onChanged,
    this.enableBorderColor,
    this.focusedBorder,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty)
          AppText(
            text: title,
            fontWeight: FontWeight.w500,
          ),
        if (title != null && title!.isNotEmpty) SizedBox(height: 7.px),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          style: style ??
              TextStyle(color: ColorConstant.appBlack, fontSize: 13.px),
          cursorColor: ColorConstant.appBlack,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 12.px, color: ColorConstant.appRed),
            filled: true,
            fillColor: ColorConstant.appWhite,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            isDense: true,
            contentPadding: contentPadding ??
                EdgeInsets.only(
                    top: 15.px, bottom: 15.px, left: 20.px, right: 10.px),
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                    color: ColorConstant.appGrey.withOpacity(0.7),
                    fontSize: 13.px),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstant.appBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstant.appBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: enableBorderColor ?? ColorConstant.appBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: focusedBorder ?? ColorConstant.appBlack),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
