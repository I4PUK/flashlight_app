import 'package:bloc/bloc.dart';
import 'package:flashlight/flashlight.dart';

part 'flashlight_event.dart';
part 'flashlight_state.dart';

class FlashlightBloc extends Bloc<FlashlightEvent, FlashlightState> {
  @override
  FlashlightState get initialState => FlashlightInitialState();

  @override
  Stream<FlashlightState> mapEventToState(FlashlightEvent event) async* {
    if (event is FlashlightInitialEvent) {
      final hasFlashlight = await _hasFlashlight;
      yield !hasFlashlight
          ? FlashlightIsAvailable(isOn: false)
          : FlashlightNotAvailable();
    }

    if (event is FlashlightTouchEvent) {
      yield _switchFlashlight();
    }
  }

  Future<bool> get _hasFlashlight async => await Flashlight.hasFlashlight;

  FlashlightState _switchFlashlight() {
    final currentState = this.state;

    if (currentState is FlashlightIsAvailable) {
      bool isOn = currentState.isOn;
      isOn ? Flashlight.lightOff() : Flashlight.lightOn();
      return FlashlightIsAvailable(isOn: !isOn);
    } else {
      return FlashlightNotAvailable();
    }
  }
}
