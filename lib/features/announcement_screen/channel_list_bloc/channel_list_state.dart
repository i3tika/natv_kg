part of 'channel_list_bloc.dart';

@immutable
abstract class ChannelListState {}

class ChannelListInitial extends ChannelListState {}

class ChannelListSuccess extends ChannelListState {
  ChannelListSuccess({required this.data});
  final List<Channel> data;

  // get model => null;
}

class ChannelListError extends ChannelListState {}
