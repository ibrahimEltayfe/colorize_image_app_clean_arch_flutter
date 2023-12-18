import 'package:colorize_image/core/utils/services/dio_helper.dart';
import 'package:colorize_image/features/home/data/models/inputs/colorize_image_api_input.dart';
import 'package:dio/dio.dart';

class ColorizeImageDataSource{
  final DioHelper dioHelper;
  ColorizeImageDataSource(this.dioHelper);

  Future<Response<Map<String,dynamic>?>> generateColorizedImage(ColorizeImageApiInput apiInput) async{
    return await dioHelper.uploadImage(apiInput.imageData);
  }
}