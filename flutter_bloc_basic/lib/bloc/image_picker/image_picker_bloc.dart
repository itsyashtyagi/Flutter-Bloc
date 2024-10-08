import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_state.dart';
import 'package:flutter_bloc_basic/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryCapture);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryCapture(
      GalleryCapture event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
