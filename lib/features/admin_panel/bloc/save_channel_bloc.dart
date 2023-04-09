import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natv_kg/features/admin_panel/bloc/save_channel_event.dart';

import '../models/get_list_channel_model.dart';
import '../repository/savechannelRepo.dart';


part 'save_channel_state.dart';

class SaveChannelBloc extends Bloc<SaveChannelEvent, SaveChannelState> {
  SaveChannelBloc({required this.repo}) : super(SaveChannelInitial()) {
    on<GetChannelEvent>(
      (event, emit) async {
        final model = await repo.getChannel();
        emit(SaveChannelGet(channels: model));
      },
    );
    on<SendPostEvent>((event, emit) async {
      try {
        await repo.sendData(
            model: event.model, model2: event.model2, model3: event.model3);
        emit(SaveChannelSuccess());
      } catch (e) {
        emit(SaveChannelError());
      }
    });
  }

  final SaveChannelrepo repo;
}
