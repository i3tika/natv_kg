import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/calculate_models.dart';
import '../repositories/calculate_repo.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc({required this.repo}) : super(CalculateInitial()) {
    on<GetCalculateEvent>((event, emit) async {
      try {
       final result = await repo.calculateRepositories(
            daysCount: event.daysCount, text: event.text,channelId:event.channelId);
        emit(CalculateSuccess(data: result));
      } catch (e) {
        emit(CalculateError());
      }
    });
  }
  final CalculateRepo repo;
}
