import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:natv_kg/features/announcement_screen/ui/announcement_screen.dart';

import '../../../core_data/ui/common_widgets/ElevatedButtonChanel.dart';
import '../../../core_data/ui/theme/app_colors.dart';
import '../../../core_data/ui/theme/app_fonts.dart';
import '../../../resources/resources.dart';

class BannerScreen extends StatefulWidget {
  BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  bool isTrue = true;

  bool isFalse = false;

  FilePickerResult? result;

  String? _fileName;

  PlatformFile? pickedfile;

  bool? isLoading;

  File? fileToDisplay;

  File? fileTest;

  void pickFiles() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        // allowedExtensions: ['jpg', 'pdf', 'svg'],
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 5,
                      color: AppColors.white,
                    ),
                    SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              // shape:const RoundedRectangleBorder(
                              // side: BorderSide(
                              //   width: 2,
                              //   color: AppColors.white,
                              // ),
                              // ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AnnouncementScreen()));
                            },
                            child: Text(
                              'Размещение строчного объявления',
                              style: AppFonts.w400s14
                                  .copyWith(color: AppColors.red),
                            ))),
                  ],
                ),
                Column(
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
                              'Размещение баннерной рекламы',
                              style: AppFonts.w400s14
                                  .copyWith(color: AppColors.red),
                            ))),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(
                AppImages.logo,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.red, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Загрузите графический файл',
                    style: TextStyle(
                      fontSize: 14,
                    ).copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                pickFiles();
              },
              child: Container(
                width: 320,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Выберите файл',
                        style: TextStyle(
                          fontSize: 14,
                        ).copyWith(color: Colors.grey),
                      ),
                    ),
                    if (pickedfile != null)
                      SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.file(fileToDisplay!)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButtonChanel(),
            ),
          ],
        ),
      ),
    );
  }
}
