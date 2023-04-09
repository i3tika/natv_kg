import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ContainerSuccesWidget extends StatelessWidget {
  const ContainerSuccesWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          color: AppColors.red,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Вам остался один шаг - нажмите разместить и\n получите код для оплаты! ',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      backgroundColor: AppColors.white),
                  onPressed: () {},
                  child: Text(
                    title,
                    style: TextStyle(color: AppColors.red),
                  )),
            )
          ],
        ));
  }
}