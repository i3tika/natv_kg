part of 'channel_list_bloc.dart';

@immutable
abstract class ChannelListState {}

class ChannelListInitial extends ChannelListState {}

class ChannelListSuccess extends ChannelListState {
  ChannelListSuccess({required this.data});
  final List<ChanelListModel> data;
}

// class RickMorteSucces extends ChannelListState {
//   final RickandMortyModel model;
//   RickMorteSucces({required this.model});
// }
class ChannelListError extends ChannelListState {}
