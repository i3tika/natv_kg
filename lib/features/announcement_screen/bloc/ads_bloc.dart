import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  AdsBloc() : super(AdsInitial()) {
    on<AdsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
