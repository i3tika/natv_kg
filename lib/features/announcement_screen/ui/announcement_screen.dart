import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/core_data/ui/theme/app_colors.dart';
import 'package:natv_kg/core_data/ui/theme/app_fonts.dart';
import 'package:natv_kg/features/announcement_screen/calculate_bloc/calculate_bloc.dart';
import 'package:natv_kg/features/announcement_screen/models/models.dart';
import 'package:natv_kg/features/announcement_screen/rick_and_morty_bloc/rick_morty_bloc.dart';
import 'package:natv_kg/resources/resources.dart';

import '../../../core_data/ui/common_widgets/channel_list_container.dart';
import '../../../core_data/ui/common_widgets/circle_avatar_widget.dart';
import '../../../core_data/ui/common_widgets/container_banner.dart';
import '../../../core_data/ui/common_widgets/container_public.dart';
import '../../../core_data/ui/common_widgets/container_succes_widget.dart';
import '../../../core_data/ui/common_widgets/registation_textfield_widget.dart';
import '../../banner_screen/ui/banner_screen.dart';
import '../../registration_request_screen/ui/registration_screen.dart';
import '../channel_list_bloc/channel_list_bloc.dart';
import '../models/channel_list_models.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key, this.day});

  final int? day;
  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

List data = [];
List<ChannelModel> defaultList = [];
// List<ChannelModel> listDate = data;

// ChanelListModel dateModel = data;

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final textController = TextEditingController();
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerDay = TextEditingController();
  bool _expanded = true;
  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  Widget? list;

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
    Widget listChannel;
    // BlocProvider.of<RickMortyBloc>(context).add(GetRickMortyEvent());
    BlocProvider.of<ChannelListBloc>(context).add(GetChannelListEvent());
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
                  ContainerPublic(),
                  ContainerBanner(),
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
                  children: [
                    const CircleAvatarWidget(
                      title: 'Введите текст вашего объявления',
                      intNumber: '1',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatarWidget(
                      title:
                          'Выберите телеканалы и даты,\nи нажмите "Разместить объявление"',
                      intNumber: '2',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatarWidget(
                      title: 'Оплатите объявление!',
                      intNumber: '3',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RegistrationTextField(
                      textEditingController: controllerDay,
                      title: 'Количесвто дней',
                      number: '',
                    ),
                    RegistrationTextField(
                      textEditingController: controllerID,
                      title: 'ID Channel',
                      number: '',
                    ),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<CalculateBloc>(context).add(
                              GetCalculateEvent(
                                  channelId: 9,
                                  daysCount: 5,
                                  text: textController.text));
                        },
                        child: Text('success')),
                    BlocBuilder<CalculateBloc, CalculateState>(
                      builder: (context, state) {
                        if (state is CalculateSuccess) {
                          print('Цена ${state.data.price}');
                          return Text('${state.data.priceWithDiscount}');
                        }
                        return Text('error');
                      },
                    ),
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: _expanded ? 300 : 750,
                      width: 500,
                      child: BlocBuilder<ChannelListBloc, ChannelListState>(
                          builder: (context, state) {
                        // if (state is ChannelListInitial) {
                        //   BlocProvider.of<ChannelListBloc>(context)
                        //       .add(GetChannelListEvent());
                        // }
                        if (state is ChannelListSuccess) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.data.length,
                              itemBuilder: (context, index) =>
                                  ChannelListContainer(
                                    price: state.data[index].pricePerLetter ?? 0,
                                    id: state.data[index].id ?? 0,
                                    channelName:
                                        state.data[index].channelName ?? '',
                                    // images: state.data[index].logo ?? '',
                                    // title: '${state.data[index].id }',
                                    // model: state.model,

                                    child: Image.network(
                                      'https://natv.kg/static/user/ima/logo.png',
                                      // state.data[index].logo ?? '',
                                      // state.data[index].logo == "" ||
                                      //         state.data[index].logo == "string"
                                      //     ? 'https://natv.kg/static/user/ima/logo.png'
                                      //     : state.data[index].logo ??
                                      //         'https://natv.kg/static/user/ima/logo.png',
                                      height: 60,
                                      width: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    //   range: widget.day.toString(),
                                    //   channelName:
                                    //       state.data[index].channelName ?? '',
                                    //   // logo: state.data[index].logo?[index] ?? '',
                                    //   id: state.data[index].id ?? 0,
                                  ));
                        }
                        return const Center(
                          child: Text(
                            'Произошла ошибка',
                            style: TextStyle(color: AppColors.red),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                _expanded = !_expanded;
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text(
                            'БОЛЬШЕ КАНАЛОВ',
                            style: AppFonts.w500s25,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const RegistrationTextField(
                title: 'КОНТАКТНЫЙ НОМЕР',
                number: 'Пример : 0770314004',
              ),
              const RegistrationTextField(
                title: 'E-MAIL',
                number: 'primer@gmail.com',
              ),
              const RegistrationTextField(
                title: 'УКАЖИТЕ ФИО',
                number: 'ФИО / НАЗВАНИЕ ОРГАНИЗАЦИИ',
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                    '*Поля не обязательны для заполнения. Укажите номер \nтелефона и мы отправим Вам код для оплаты SMS \nсообщением.\n*Оплатите любым удобным способом'),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerSuccesWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationRequest(
                                simvol: charLength,
                                textEditingController: textController,
                              )));
                },
                title: 'РАЗМЕСТИТЬ ОБЪЯВЛЕНИЕ',
              )
            ],
          ),
        ),
      ),
    );
  }
}
