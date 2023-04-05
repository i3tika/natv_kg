import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/core_data/dio_settings/dio_settings.dart';
import 'package:natv_kg/features/announcement_screen/channel_list_bloc/channel_list_bloc.dart';

import 'features/announcement_screen/repositories/get_chanel_repo.dart';
import 'features/announcement_screen/ui/announcement_screen.dart';

void main() {
  runApp(NatvKg());
}

class NatvKg extends StatelessWidget {
  const NatvKg({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          GetChanelList(dio: RepositoryProvider.of<DioSettings>(context).dio),
      child: BlocProvider(
        create: (context) => ChannelListBloc(
            repo: RepositoryProvider.of<GetChanelList>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnnouncementScreen(),
        ),
      ),
    );
  }
}
