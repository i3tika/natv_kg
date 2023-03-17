import 'package:flutter/material.dart';
import 'package:natv_kg/core_data/ui/theme/app_colors.dart';

abstract class AppFonts {
  static const TextStyle w400s14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const TextStyle w100s14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white);
  static const TextStyle w400s20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.white);
  static const TextStyle w500s15 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black);
  static const TextStyle w400s18 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 126, 126, 126));
}
