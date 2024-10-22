// ignore_for_file: constant_identifier_names

import 'package:crm/core/theming/app_colors.dart';
import 'package:crm/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

const double WIDTH = 380;
const double HEIGHT = 55;

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.filled = true,
      this.icon,
      this.color,
      this.textStyle,
      this.enabled = true});

  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final bool? filled;
  final IconData? icon;
  final Color? color;
  final TextStyle? textStyle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final TextStyle altTextStyle = filled!
        ? AppTextStyles.font18WhiteSemiBold(context)
        : AppTextStyles.font18BlackSemiBold(context);
    return icon != null
        ? _buildTextButtonWithIcon(context, altTextStyle)
        : _buildTextButton(context, altTextStyle);
  }

  TextButton _buildTextButton(BuildContext context, TextStyle altTextStyle) {
    return TextButton(
      style: _buildButtonStyle(),
      onPressed: enabled ? onPressed : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: textStyle ?? altTextStyle),
      ),
    );
  }

  TextButton _buildTextButtonWithIcon(
      BuildContext context, TextStyle altTextStyle) {
    return TextButton.icon(
      style: _buildButtonStyle(),
      onPressed: enabled ? onPressed : null,
      icon: Icon(
        icon,
        color: AppColors.white,
      ),
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: textStyle ?? altTextStyle),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    final Color targetedColor =
        filled! ? color ?? AppColors.red : AppColors.white;
    return TextButton.styleFrom(
      minimumSize: Size(
        width ?? WIDTH,
        height ?? HEIGHT,
      ),
      backgroundColor:
          enabled ? targetedColor : AppColors.darkGrey.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: !filled!
            ? const BorderSide(
                color: AppColors.darkGrey,
                width: 1,
              )
            : BorderSide.none,
      ),
    );
  }
}
