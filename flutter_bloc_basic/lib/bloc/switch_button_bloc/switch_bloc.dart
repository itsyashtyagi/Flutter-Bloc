import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_event.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDissableNotification>(_enableOrDissableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDissableNotification(
      EnableOrDissableNotification events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider.toDouble()));
  }
}
