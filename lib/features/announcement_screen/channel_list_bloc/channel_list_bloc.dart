import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/channel_list_models.dart';
import '../models/rick_morte_models.dart';
import '../repositories/channel_list_repo.dart';

part 'channel_list_event.dart';
part 'channel_list_state.dart';

class ChannelListBloc extends Bloc<ChannelListEvent, ChannelListState> {
  ChannelListBloc({required this.repo}) : super(ChannelListInitial()) {
    on<GetChannelListEvent>((event, emit) async {
      try {
        final result = await repo.fetchChannelList();
        emit(ChannelListSuccess(data: result));
      } catch (e) {
        emit(ChannelListError());
      }
    });
    // on<GetChannelListEvent>((event, emit) async {
    //   try {
    //     final model = await repo.getRickMorte();
    //     emit(RickMorteSucces(model: model));
    //   } catch (e) {
    //     emit(ChannelListError());
    //   }
    // });
  }
  final GetChanelListRepo repo;
}
