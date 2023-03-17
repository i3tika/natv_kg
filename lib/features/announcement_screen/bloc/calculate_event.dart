part of 'calculate_bloc.dart';

@immutable
abstract class CalculateEvent {}

class SendCalculate extends CalculateEvent {
  final GetCalculate repo;
  SendCalculate({required this.repo});
}
