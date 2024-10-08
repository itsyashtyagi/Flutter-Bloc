import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                return state.file == null
                    ? InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraCapture());
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.camera),
                        ),
                      )
                    : Image.file(
                        File(state.file!.path.toString()),
                        height: 200,
                        width: 200,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
