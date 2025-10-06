import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final TextAlign? textAlign;
  final String? initialValue;
  final bool? isValidator;
  final bool? isObscureText;
  final bool? isclickable;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? colorEnableBorder;
  final Color? disabledBorder;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final int? maxLines;
  final FormFieldSetter<String>? onSaved;
  final Key? valueKey;
  final Function()? onTap;
  final String? apiError;
  const CustomTextForm({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.isObscureText,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.cursorColor,
    this.cursorErrorColor,
    this.hoverColor,
    this.fillColor,
    this.focusNode,
    this.nextFocusNode,
    this.colorEnableBorder,
    this.maxLines,
    this.onSaved,
    this.valueKey,
    this.isclickable,
    this.disabledBorder,
    this.initialValue,
    this.onTap,
    this.textAlign,
    this.isValidator,
    this.apiError,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: valueKey,
      initialValue: initialValue,
      enabled: isclickable,
      readOnly: isclickable ?? false,
      onTap: onTap,
      onFieldSubmitted: (value) =>
          FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: focusNode,
      onChanged: onSaved,
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AppStyles.styleRegular15(
              context,
            ).copyWith(color: AppColors.grey2Color),
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(14),
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(minWidth: 14, minHeight: 8),
        hoverColor: hoverColor,
        filled: true,
        fillColor: fillColor ?? AppColors.greyColor,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        errorText: apiError,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          // borderSide: BorderSide(color: R.colors.borderColorsLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          borderSide: BorderSide(
            color: colorEnableBorder ?? AppColors.whiteColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: style,
      obscureText: isObscureText ?? false,
      cursorColor: cursorColor ?? AppColors.primryColor,
      cursorErrorColor: cursorErrorColor ?? Colors.red,
      validator: isValidator ?? true
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$hintText مطلوب';
              }
              return null;
            }
          : null,
    );
  }
}
