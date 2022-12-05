import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FileManager {
  static Future<File> pickImage() async {
    var file = File('');
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowCompression: true,
      withData: false,
      withReadStream: false,
      // allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      file = File(result.files.first.path!);
    }
    return file;
  }
}
