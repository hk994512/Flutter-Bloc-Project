import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightState()) {
    on<LightEvent>((event, emit) {
      emit(LightState());
    });
    on<DarkEvent>((event, emit) {
      emit(DarkState());
    });
  }
}
