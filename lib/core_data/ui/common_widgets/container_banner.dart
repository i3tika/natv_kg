import 'package:flutter/material.dart';

import '../../../features/banner_screen/ui/banner_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ContainerBanner extends StatelessWidget {
  const ContainerBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 190,
          height: 5,
          color: AppColors.white,
        ),
        SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BannerScreen()));
                },
                child: Text(
                  'Размещение баннерной рекламы',
                  style: AppFonts.w400s14
                      .copyWith(color: AppColors.red),
                ))),
      ],
    );
  }
}