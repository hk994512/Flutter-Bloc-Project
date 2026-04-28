part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class LightEvent extends ThemeEvent {}

final class DarkEvent extends ThemeEvent {}
