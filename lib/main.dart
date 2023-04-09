import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/core_data/dio_settings/dio_settings.dart';
import 'package:natv_kg/features/announcement_screen/repositories/calculate_repo.dart';
import 'package:natv_kg/features/announcement_screen/repositories/rick_morty_repo.dart';
import 'package:natv_kg/features/announcement_screen/rick_and_morty_bloc/rick_morty_bloc.dart';

import 'features/announcement_screen/calculate_bloc/calculate_bloc.dart';
import 'features/announcement_screen/channel_list_bloc/channel_list_bloc.dart';
import 'features/announcement_screen/repositories/channel_list_repo.dart';
import 'features/announcement_screen/ui/announcement_screen.dart';

void main() {
  runApp(NatvKg());
}

class NatvKg extends StatelessWidget {
  const NatvKg({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetChanelListRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => CalculateRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => RickMortyRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChannelListBloc(
                repo: RepositoryProvider.of<GetChanelListRepo>(context)),
          ),
          BlocProvider(
            create: (context) => CalculateBloc(
                repo: RepositoryProvider.of<CalculateRepo>(context)),
          ),
          BlocProvider(
            create: (context) => RickMortyBloc(
                repo: RepositoryProvider.of<RickMortyRepo>(context)),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnnouncementScreen(),
        ),
      ),
    );
  }
}
