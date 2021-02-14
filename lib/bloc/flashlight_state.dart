part of 'flashlight_bloc.dart';

abstract class FlashlightState {
  const FlashlightState();
}

class FlashlightInitialState extends FlashlightState {}

class FlashlightIsAvailable extends FlashlightState {
  final bool isOn;
  const FlashlightIsAvailable({this.isOn});
}

class FlashlightNotAvailable extends FlashlightState {}
