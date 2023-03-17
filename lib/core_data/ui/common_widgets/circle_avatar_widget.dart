import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.title,
    required this.intNumber,
  });

  final String title;
  final String intNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.red,
          radius: 35,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 32,
            child: Text(
              intNumber,
              style: AppFonts.w400s20.copyWith(color: AppColors.red),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: AppFonts.w400s14.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
