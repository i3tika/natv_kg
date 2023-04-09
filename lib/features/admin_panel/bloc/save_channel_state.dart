part of 'save_channel_bloc.dart';

@immutable
abstract class SaveChannelState {}

class SaveChannelInitial extends SaveChannelState {}

class SaveChannelSuccess extends SaveChannelState {}

class SaveChannelError extends SaveChannelState {}

class SaveChannelGet extends SaveChannelState {
  final List<GetListChannel> channels;

  SaveChannelGet({required this.channels});
}
