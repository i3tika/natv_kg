
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ContainerPublic extends StatelessWidget {
  const ContainerPublic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 5,
          color: AppColors.red,
        ),
        SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Размещение строчного объявления',
                  style: AppFonts.w400s14
                      .copyWith(color: AppColors.red),
                ))),
      ],
    );
  }
}
