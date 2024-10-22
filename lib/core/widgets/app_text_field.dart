// ignore_for_file: constant_identifier_names

import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double WIDTH = 370;
const double HEIGHT = 75;

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.hint,
    this.maxWidth,
    this.maxHeight,
    this.textStyle,
    this.fillColor,
    this.isObscured,
    this.isMultiline,
    this.insideHint = false,
    this.suffixIcon,
    this.enabled,
    this.readOnly,
    this.validator,
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.numeric,
  });

  final TextEditingController? controller;
  final String hint;
  final double? maxWidth;
  final double? maxHeight;
  final TextStyle? textStyle;
  final Color? fillColor;
  final bool? isObscured;
  final bool? isMultiline;
  final bool? insideHint;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onChanged;
  final bool? numeric;

  @override
  Widget build(BuildContext context) {
    return insideHint!
        ? _buildTextFieldWithInsideHint(hint, context)
        : _buildTextFieldWithOutsideHint(context);
  }

  ConstrainedBox _buildTextFieldWithOutsideHint(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? WIDTH,
        maxHeight: maxHeight ?? HEIGHT,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: AppTextStyles.font16DarkGreySemiBold(context)
                .copyWith(color: AppColors.darkGrey.withOpacity(0.5)),
          ),
          _buildTextFieldWithInsideHint(null, context),
        ],
      ),
    );
  }

  TextFormField _buildTextFieldWithInsideHint(
      String? hint, BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: numeric ?? false
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
            ]
          : null,
      onSaved: onSaved,
      initialValue: initialValue,
      style: AppTextStyles.font18BlackSemiBold(context),
      obscureText: isObscured ?? false,
      cursorHeight: 30,
      maxLines: isMultiline ?? false ? 30 : 1,
      minLines: 1,
      enabled: enabled,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        suffixIcon: suffixIcon,
        hintText: hint,
        fillColor: enabled ?? true ? AppColors.white : AppColors.grey,
        filled: true,
        hintStyle: textStyle ??
            AppTextStyles.font18BlackSemiBold(context)
                .copyWith(color: AppColors.darkGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? HEIGHT,
          maxWidth: maxWidth ?? WIDTH,
        ),
      ),
    );
  }
}
