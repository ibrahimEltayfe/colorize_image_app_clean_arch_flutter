import 'package:colorize_image/features/home/data/models/inputs/colorize_image_api_input.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

extension ImageMapper on ColorizeImageInput{
  Future<ColorizeImageApiInput> mapToApiInput() async{
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFile.path,
        filename: path.basename(imageFile.path),
      ),
      'sync': "1",
      'return_type' : "2"
    });

    return ColorizeImageApiInput(
      imageData: formData
    );
  }
}