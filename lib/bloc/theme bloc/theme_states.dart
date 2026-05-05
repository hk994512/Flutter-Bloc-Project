import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeStates extends Equatable {
  const ThemeStates({this.themeMode = ThemeMode.system});
  final ThemeMode themeMode;
  ThemeStates copyWith({ThemeMode? mode}) {
    return ThemeStates(themeMode: mode ?? themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}
