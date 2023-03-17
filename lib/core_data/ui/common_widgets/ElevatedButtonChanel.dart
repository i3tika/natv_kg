import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ElevatedButtonChanel extends StatelessWidget {
  const ElevatedButtonChanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.red,
      ),
      onPressed: () {},
      child: (Text(
        'БОЛЬШЕ КАНАЛОВ',
        style: AppFonts.w100s14.copyWith(color: AppColors.white),
      )),
    );
  }
}
