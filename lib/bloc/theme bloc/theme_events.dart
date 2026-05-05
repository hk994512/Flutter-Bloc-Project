import 'package:equatable/equatable.dart';

class ThemeEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SystemThemeEvent extends ThemeEvents {}

class LightThemeEvent extends ThemeEvents {}

class DarkThemeEvent extends ThemeEvents {}
