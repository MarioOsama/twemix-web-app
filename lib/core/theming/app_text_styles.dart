import 'package:crm/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle font30BlackSemiBold(BuildContext context) => const TextStyle(
        fontSize: 30,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font24WhiteSemiBold(BuildContext context) => const TextStyle(
        fontSize: 24,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font24BlackSemiBold(BuildContext context) => const TextStyle(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font22BlackMedium(BuildContext context) => const TextStyle(
        fontSize: 22,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Kufam',
      );
  static TextStyle font18BlackSemiBold(BuildContext context) => const TextStyle(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font18WhiteSemiBold(BuildContext context) => const TextStyle(
        fontSize: 18,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font18BlackMedium(BuildContext context) => const TextStyle(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Kufam',
      );
  static TextStyle font16BlackSemiBold(BuildContext context) => const TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font16BlackGreySemiBold(BuildContext context) =>
      const TextStyle(
        fontSize: 16,
        color: AppColors.blackGrey,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font16WhiteSemiBold(BuildContext context) => const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font16DarkGreySemiBold(BuildContext context) =>
      const TextStyle(
        fontSize: 16,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
        fontFamily: 'Kufam',
      );
  static TextStyle font14DarkGreyMedium(BuildContext context) =>
      const TextStyle(
        fontSize: 14,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w500,
        fontFamily: 'Kufam',
      );
}
