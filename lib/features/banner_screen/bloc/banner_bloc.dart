import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
