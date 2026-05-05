import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class SwitchEventON extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double slideValue;
  const SliderEvent({required this.slideValue});
  @override
  List<Object?> get props => [slideValue];
}
