import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:natv_kg/core_data/ui/theme/app_colors.dart';
import 'package:natv_kg/core_data/ui/theme/app_fonts.dart';
import 'package:natv_kg/resources/resources.dart';

import '../../../core_data/ui/common_widgets/linearcontainer.dart';

class RegistrationRequest extends StatelessWidget {
  const RegistrationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey.withOpacity(0.3),
              child: Row(
                children: [Image.asset(AppImages.logo)],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('ЗАЯВКА ЗАРЕГИСТРИРОВАНА',
                  style: AppFonts.w400s30.copyWith(color: AppColors.red)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Text(
                  'Вы успешно зарегистрировали заявку на размещение бегущей строки. Вам необходимо запомнить или записать код оплаты, сумму к оплате, срок до которого необходимо оплатить и внести оплату любым удобным для Вас способом.'),
            ),
            const LinearContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                  'Вы имеете возможность оплатить объявление \nкартами Visa и MasterCard'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Container(
                width: 350,
                height: 70,
                color: AppColors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ОПЛАТИТЬ",
                      style: AppFonts.w300s20.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            const LinearContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text('СТОИМОСТЬ ОБЪЯВЛЕНИЯ ',
                  style: AppFonts.w400s18.copyWith(color: AppColors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Оплатить необходимо сумму не менее указанной стоимости \nзаявки. В случае, если сумма к оплате будет меньше, заявка \nне будет размещена.',
                style: AppFonts.w100s12.copyWith(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text('150 сом', style: AppFonts.w400s18.copyWith(color: AppColors.red),),
            ),
            const LinearContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text('ТЕКСТ ОБЪЯВЛЕНИЯ ',
                  style: AppFonts.w400s18.copyWith(color: AppColors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Символов :7',
                style: AppFonts.w100s12.copyWith(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text('150 сом', style: AppFonts.w400s18.copyWith(color: AppColors.red),),
            ),
            const LinearContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text('СРОК ОПЛАТЫ ОБЪЯВЛЕНИЯ ',
                  style: AppFonts.w400s18.copyWith(color: AppColors.black)),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Вам необходимо произвести оплату до 15:00 рабочего дня, предшествующего выходу объявления в эфир. Оплатите выбранные даты заранее и размещение будет Вам гарантировано. В случае неоплаты ваша заявка не будет выполнена. :',
                style: AppFonts.w100s12.copyWith(color: Colors.grey),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(left: 20, top: 20),
               child: Text('Уважаемый рекламодатель', style: AppFonts.w400s18.copyWith(color: AppColors.red),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 40, top: 15),
               child: Text('Оплатите выбранные даты заранее и \nразмещение будет Вам гарантировано.\nКоличество объявлений для размещения \nограничено.',style: AppFonts.w100s14.copyWith(color: Colors.black),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 40, top: 5),
               child: Text('Внесите сумму не менее указанной в стоимости \nобъявления. В противном случае мы не сможем \nпринять Ваше объявление к размещению. \nУчитывайте то, что при оплате в терминале \nможет взыматься комиссия.',style: AppFonts.w100s14.copyWith(color: Colors.black),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 40, top: 5),
               child: Text('В случае оплаты позже указанного срока, дата \nначала размещения рекламы смещается \nсоответственно на день, следующий за днем \nоплаты и сроки исполнения заказа могут быть \nизменены.',style: AppFonts.w100s14.copyWith(color: Colors.black),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 40, top: 5),
               child: Text('Произвести оплату можно через платежные \nтерминалы: МТС, Terem Pay, Quickpay, О!\nДеньги, Balance.kg, QIWI, Кыргыз Почтасы, \nЭлсом, Optima Bank, Optima24, UMAI, MegaPay',style: AppFonts.w100s14.copyWith(color: Colors.black),),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 25 , top: 30),
               child: Container(
                height: 60,
                width: 350,
                color: AppColors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('РАЗМЕСТИТЬ ЕЩЕ ОБЪЯВЛЕНИЕ', style: AppFonts.w400s18.copyWith(color: AppColors.white),)
                  ],
                ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 25 , top: 10),
               child: Container(
                height: 70,
                width: 350,
                color: AppColors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ИЛИ РАЗМЕСТИТЬ БАННЕРНУЮ \n                      РЕКЛАМУ', style: AppFonts.w400s18.copyWith(color: AppColors.white),)
                  ],
                ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}
