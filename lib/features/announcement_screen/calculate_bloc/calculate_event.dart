part of 'calculate_bloc.dart';

@immutable
abstract class CalculateEvent {}

class GetCalculateEvent extends CalculateEvent {
  final String text;
  final double daysCount;
  final int channelId;
  GetCalculateEvent({required this.text, required this.daysCount,required this.channelId});
}
