import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/switch_event.dart';
import 'package:bloc_project/bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<SwitchEventON>(onSwitched);
    on<SliderEvent>(_slider);
  }

  void onSwitched(SwitchEventON event, Emitter emit) {
    emit(state.copyWith(isOn: !state.isON));
  }

  void _slider(SliderEvent event, Emitter emit) {
    emit(state.copyWith(sliderVal: event.slideValue));
  }
}
