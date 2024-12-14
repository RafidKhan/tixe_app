import 'dart:io';

import 'package:file_picker/file_picker.dart';

class CustomFilePicker {
  /// Predefined allowed file extensions
  static const List<String> _allowedExtensions = [
    'jpg',
    'png',
    'pdf',
    'doc',
    'docx'
  ];

  static Future<void> pickSingleFile(
      {required Function(File file) onSuccess}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: _allowedExtensions,
      );

      if (result != null && result.files.single.path != null) {
        return onSuccess(File(result.files.single.path!));
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }

  static Future<void> pickMultipleFiles(
      {required Function(List<File> files) onSuccess}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: _allowedExtensions,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        return onSuccess(result.files.map((file) => File(file.path!)).toList());
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }
}
