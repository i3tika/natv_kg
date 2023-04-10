import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:natv_kg/features/announcement_screen/repositories/rick_morty_repo.dart';

import '../models/rick_morte_models.dart';

part 'rick_morty_event.dart';
part 'rick_morty_state.dart';

class RickMortyBloc extends Bloc<RickMortyEvent, RickMortyState> {
  RickMortyBloc({required this.repo}) : super(RickMortyInitial()) {
    on<GetRickMortyEvent>((event, emit) async {
      try {
        final models = await repo.getRickMorte();
        emit(RickMortySuccess(model: models));
      } catch (e) {
        emit(RickMortyError());
      }
    });
  }
  final RickMortyRepo repo;
}
