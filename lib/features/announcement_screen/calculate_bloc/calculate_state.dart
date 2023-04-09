part of 'calculate_bloc.dart';

@immutable
abstract class CalculateState {}

class CalculateInitial extends CalculateState {}

class CalculateSuccess extends CalculateState {
  final CalculateModels data;
  CalculateSuccess({required this.data});
}

class CalculateError extends CalculateState {}
