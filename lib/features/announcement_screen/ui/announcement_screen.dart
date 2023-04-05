import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/core_data/ui/theme/app_colors.dart';
import 'package:natv_kg/core_data/ui/theme/app_fonts.dart';
import 'package:natv_kg/features/announcement_screen/channel_list_bloc/channel_list_bloc.dart';
import 'package:natv_kg/resources/resources.dart';

import '../../../core_data/ui/common_widgets/ElevatedButtonChanel.dart';
import '../../../core_data/ui/common_widgets/circle_avatar_widget.dart';
import '../../banner_screen/ui/banner_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final textController = TextEditingController();

  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  // hitTextRan() {
  //   var list = [
  //     'Продаю кота из Дагестана',
  //     'КТРК канал делает скиндку по 8% с 10 марта по 15 марта ',
  //     'НТС дарит скидку всем кто берет реклмаму с 1 го по 5',
  //     'Весна пришла пора релкаму рибуить',
  //     'выходной'
  //   ];
  //   final _random = Random();

  //   var element = list[_random.nextInt(list.length)];
  // }

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
                        width: 190,
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
                                // shape:const RoundedRectangleBorder(
                                // side: BorderSide(
                                //   width: 2,
                                //   color: AppColors.white,
                                // ),
                                // ),
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
              // Image.asset(
              //   AppImages.logo,
              //   width: 100,
              //   height: 100,
              // ),
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
                      Text(
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
                  children: [
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

              // Center(
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 150,
              //     child: BlocBuilder<ChannelListBloc, ChannelListState>(
              //       builder: (context, state) {
              //         if (state is ChannelListSuccess) {
              //           return ListView.builder(
              //             itemCount: 5,
              //             shrinkWrap: true,
              //             itemBuilder: (BuildContext context, int index) {
              //               return Container(
              //                 width: 300,
              //                 height: 100,
              //                 color: AppColors.darken,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(16.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Row(
              //                         children: [
              //                           Image.network(
              //                             AppImages.logo,
              //                             width: 100,
              //                             height: 65,
              //                           ),
              //                           const SizedBox(
              //                             width: 15,
              //                           ),
              //                           // Text(
              //                           //     state.models[index].channelName ?? ''),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         }
              //         return Center(
              //           child: Text('404'),
              //         );
              //       },
              //     ),
              //   ),
              // // ),
              // Center(
              //   child: ElevatedButtonChanel(),
              // ),
              // ElevatedButtonChanel(
              //   (Text
              //     'РАЗМЕСТИТЬ ЕЩЕ ОБЪЯВЛЕНИЕ',
              //     style: AppFonts.w100s14.copyWith(color: AppColors.white),
              //   )),
              // ElevatedButtonChanel(
              // (Text
              //   'ИЛИ РАЗМЕСТИТЬ БАННЕРНУЮ РЕКЛАМУ',
              //   style: AppFonts.w100s14.copyWith(color: AppColors.white),
              // )),
              // (Text
              //   'ЗАЯВКА ЗАРЕГИСТРИРОВАНА',
              //   style: AppFonts.w400s30.copyWith(color: AppColors.red
              // ),
              //   (Text
              //   'Вы успешно зарегистрировали заявку на размещение бегущей строки. Вам необходимо запомнить или записать код оплаты, сумму к оплате, срок до которого необходимо оплатить и внести оплату любым удобным для Вас способом.',
              //   style: AppFonts.w400s14.copyWith(color: AppColors.black
              // ),
              //   (Text
              //   'Вы успешно зарегистрировали заявку на размещение бегущей строки. Вам необходимо запомнить или записать код оплаты, сумму к оплате, срок до которого необходимо оплатить и внести оплату любым удобным для Вас способом.',
              //   style: AppFonts.w400s14.copyWith(color: AppColors.black
              // ),
              //   (Text
              //   'СТОИМОСТЬ ОБЪЯВЛЕНИЯ',
              //   style: AppFonts.w400s18.copyWith(color: AppColors.black
              // ),
              //   (Text
              //   'Оплатить необходимо сумму не менее указанной стоимости заявки. В случае, если сумма к оплате будет меньше, заявка не будет размещена.',
              //   style: AppFonts.w400s12.copyWith(color: AppColors.grey
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
