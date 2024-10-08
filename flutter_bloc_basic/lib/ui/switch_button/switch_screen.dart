import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_bloc.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_event.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_state.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Switch Example"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(fontSize: 20),
                    ),
                    BlocBuilder<SwitchBloc, SwitchStates>(
                      buildWhen: (previous, current) =>
                          previous.isSwitch != current.isSwitch,
                      builder: (context, state) {
                        return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDissableNotification());
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.slider != current.slider,
                  builder: (context, state) {
                    return Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.slider),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.slider != current.slider,
                  builder: (context, state) {
                    return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
