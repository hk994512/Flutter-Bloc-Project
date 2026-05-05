import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  final XFile? pickedFile;
  final bool isLoading;
  final String? errorMessage;

  const ImagePickerStates({
    this.pickedFile,
    this.isLoading = false,
    this.errorMessage,
  });

  ImagePickerStates copyWith({
    XFile? pickFile,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ImagePickerStates(
      pickedFile: pickFile ?? pickedFile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [pickedFile, isLoading, errorMessage];
}
