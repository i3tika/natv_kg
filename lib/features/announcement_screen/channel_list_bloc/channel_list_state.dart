part of 'channel_list_bloc.dart';

@immutable
abstract class ChannelListState {}

class ChannelListInitial extends ChannelListState {}

class ChannelListSuccess extends ChannelListState {
  final List<ChanelListModel> models;
  ChannelListSuccess({required this.models});
}

class ChannelListError extends ChannelListState {}
