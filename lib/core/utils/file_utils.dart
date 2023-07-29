import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_monkey/core/data/models/file_type_model.dart';
import 'package:meal_monkey/core/enums/file_type.dart';

class FileUtil {
  static final ImagePicker picker = ImagePicker();

  static Future<FileTypeModel> pickFile(FileTypeEnum type) async {
    String? path;
    switch (type) {
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }

    return FileTypeModel(path: path ?? '', type: type);
  }
}
