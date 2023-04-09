import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_page.dart';
import '../../bloc/save_channel_bloc.dart';
import '../../bloc/save_channel_event.dart';
import '../../models/send_data_model.dart';



class AddChannel extends StatelessWidget {
  const AddChannel({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerChannelId = TextEditingController();
    TextEditingController controllerChannelName = TextEditingController();
    TextEditingController controllerDiscount = TextEditingController();
    TextEditingController controllerDays = TextEditingController();
    TextEditingController controllerLogoPath = TextEditingController();
    TextEditingController controllerBannerPrice = TextEditingController();
    TextEditingController controllerPricePerLetter = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [Title(color: Colors.white, child: const Text(''))],
        leading: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<SaveChannelBloc, SaveChannelState>(
          listener: (context, state) {
            if (state is SaveChannelSuccess) {
              final snackBar = SnackBar(
                content: const Text('Succes'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Введите новый канал',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              // TextField(
              //   controller: controllerChannelId,
              //   decoration: InputDecoration(
              //     labelText: 'ID',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8)),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controllerChannelName,
                decoration: InputDecoration(
                  labelText: 'Имя канала',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '% Скидки',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerDays,
                decoration: InputDecoration(
                  labelText: 'Дни',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Лого Канала',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerBannerPrice,
                decoration: InputDecoration(
                  labelText: 'Цена за Баннер',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerPricePerLetter,
                decoration: InputDecoration(
                  labelText: 'Цена за Букву',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminPage(),
                          ),
                        );
                      },
                      child: const Text('Отмена')),
                  const SizedBox(
                    width: 20,
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SaveChannelBloc>(context).add(
                          SendPostEvent(
                            model: SendDataModel(
                              active: true,
                              // channelId: int.tryParse(controllerChannelId.text),
                              channelName: controllerChannelName.text,
                              logoPath: controllerLogoPath.text,
                            ),
                            model2: Discounts(
                              discount: 10,
                              fromDaysCount: int.tryParse(controllerDays.text),
                              id: int.tryParse(controllerChannelId.text),
                            ),
                            model3: Price(
                              pricePerLetter:
                                  int.tryParse(controllerPricePerLetter.text),
                              bannerPrice:
                                  int.tryParse(controllerBannerPrice.text),
                              id: int.tryParse(controllerChannelId.text),
                            ),
                          ),
                        );
                      },
                      child: const Text('отправка'),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
