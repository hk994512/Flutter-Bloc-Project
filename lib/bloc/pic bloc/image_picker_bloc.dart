import 'package:bloc_project/bloc/pic%20bloc/image_picker_event.dart';
import 'package:bloc_project/bloc/pic%20bloc/image_picker_states.dart';
import 'package:bloc_project/utils/image_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImageUtil imageUtil;

  ImagePickerBloc(this.imageUtil) : super(const ImagePickerStates()) {
    on<PickImageFromGallery>(_gallery);
    on<PickImageFromCamera>(_camera);
  }

  Future<void> _gallery(PickImageFromGallery event, Emitter emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final galleryImage = await imageUtil.gallerysCapture();
      emit(state.copyWith(pickFile: galleryImage, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to pick image from gallery',
        ),
      );
    }
  }

  Future<void> _camera(PickImageFromCamera event, Emitter emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final cameraFile = await imageUtil.cameraCapture();
      emit(state.copyWith(pickFile: cameraFile, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to pick image from camera',
        ),
      );
    }
  }
}
