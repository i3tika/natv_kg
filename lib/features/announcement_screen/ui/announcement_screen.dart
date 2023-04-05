import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:natv_kg/core_data/ui/theme/app_colors.dart';
import 'package:natv_kg/core_data/ui/theme/app_fonts.dart';
import 'package:natv_kg/resources/resources.dart';

import '../../../core_data/ui/common_widgets/circle_avatar_widget.dart';
import '../../banner_screen/ui/banner_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final textController = TextEditingController();
  TextEditingController controllerDate = TextEditingController();

  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var list = [
      'Продаю кота из Дагестана',
      'КТРК канал делает скиндку по 8% с 10 марта по 15 марта ',
      'НТС дарит скидку всем кто берет реклмаму с 1 го по 5',
      'Весна пришла пора релкаму рибуить',
      'выходной'
    ];
    final _random = Random();

    var element = list[_random.nextInt(list.length)];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
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
                                'Размещение строчного объявления',
                                style: AppFonts.w400s14
                                    .copyWith(color: AppColors.red),
                              ))),
                    ],
                  ),
                  Column(
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(
                  AppImages.logo,
                ),
              ),
              Center(
                child: Container(
                  width: 390,
                  height: 75,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ВВЕДИТЕ ТЕКСТ ОБЪЯВЛЕНИЯ',
                        style: AppFonts.w100s14,
                      ),
                      Text(
                        'Символы: $charLength',
                        style: AppFonts.w100s14,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: SizedBox(
                  width: 390,
                  height: 200,
                  child: TextField(
                    onChanged: _onChanged,
                    maxLines: null,
                    expands: true,
                    controller: textController,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: '$element'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    CircleAvatarWidget(
                      title: 'Введите текст вашего объявления',
                      intNumber: '1',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatarWidget(
                      title:
                          'Выберите телеканалы и даты,\nи нажмите "Разместить объявление"',
                      intNumber: '2',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatarWidget(
                      title: 'Оплатите объявление!',
                      intNumber: '3',
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000));
                        
                    if (dateTime != null) {
                      setState(() {
                        selectDate = dateTime;
                      });
                    }
                  },
                  child: Text('${selectDate.day}'),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                 
                  },
                  child: Text('multi'),
                ),
              ),
              
              // Center(
              //   child: TextField(
              //     controller: controllerDate,
              //     decoration: const InputDecoration(
              //       icon: Icon(Icons.calendar_month_rounded),
              //       // labelText: dateTime,
              //     ),
              //     onTap: () async {
              //       DateTime? pickedddate = await showDatePicker(
              //           context: context,
              //           initialDate: DateTime.now(),
              //           firstDate: DateTime(2000),
              //           lastDate: DateTime(2050));
              //       // DateTime now = DateTime.now();
              //       if (pickedddate != null) {
              //         setState(() {
              //           controllerDate..text = DateFormat('sdsda').format(now);
              //         });
              //       }
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
