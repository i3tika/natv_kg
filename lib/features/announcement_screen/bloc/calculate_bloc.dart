import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:natv_kg/features/announcement_screen/models/get_calculate.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc({required this.repo}) : super(CalculateInitial()) {
    on<SendCalculate>((event, emit) {
     try {
      
     } catch (e) {
       
     }
    });
  }
  final  GetCalculate repo;
}
