part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class LightState extends ThemeState {}

final class DarkState extends ThemeState {}
