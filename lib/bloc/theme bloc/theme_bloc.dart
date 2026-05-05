import 'package:bloc_project/bloc/theme%20bloc/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_states.dart';

class ThemeBloc extends Bloc<ThemeEvents, ThemeStates> {
  ThemeBloc() : super(ThemeStates()) {
    on<SystemThemeEvent>(_system);
    on<LightThemeEvent>(_light);
    on<DarkThemeEvent>(_dark);
  }

  _system(SystemThemeEvent event, Emitter<ThemeStates> emit) {
    emit(state.copyWith(mode: ThemeMode.system));
  }

  _light(LightThemeEvent event, Emitter<ThemeStates> emit) {
    emit(state.copyWith(mode: ThemeMode.light));
  }

  _dark(DarkThemeEvent event, Emitter<ThemeStates> emit) {
    emit(state.copyWith(mode: ThemeMode.dark));
  }
}
