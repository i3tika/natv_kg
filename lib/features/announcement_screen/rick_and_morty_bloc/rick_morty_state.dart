part of 'rick_morty_bloc.dart';

@immutable
abstract class RickMortyState {}

class RickMortyInitial extends RickMortyState {}

class RickMortySuccess extends RickMortyState {
  final RickandMortyModel model;
  RickMortySuccess({required this.model});
}

class RickMortyError extends RickMortyState {}
