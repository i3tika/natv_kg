import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/chanel_list_model.dart';
import '../repositories/get_chanel_repo.dart';

part 'channel_list_event.dart';
part 'channel_list_state.dart';

class ChannelListBloc extends Bloc<ChannelListEvent, ChannelListState> {
  ChannelListBloc({required this.repo}) : super(ChannelListInitial()) {
    on<GetChannelListEvent>((event, emit) async {
      try {
        final result = await repo.fetchChannelList();
        emit(ChannelListSuccess(models: result));
      } catch (e) {
        emit(ChannelListError());
      }
    });
  }
  final GetChanelList repo;
}
