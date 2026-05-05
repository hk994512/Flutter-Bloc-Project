import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  const SwitchState({this.isON = true, this.sliderValue = 1.0});
  final bool isON;
  final double sliderValue;
  SwitchState copyWith({bool? isOn, double? sliderVal}) {
    return SwitchState(
      isON: isOn ?? isON,
      sliderValue: sliderVal ?? sliderValue,
    );
  }

  @override
  List<Object?> get props => [isON, sliderValue];
}
