import 'package:image_picker/image_picker.dart';

class ImageUtil {
  ImageUtil();
  static final instance = ImageUtil();
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      return file;
    } catch (e) {
      return null;
    }
  }

  Future<XFile?> gallerysCapture() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      return null;
    }
  }
}
