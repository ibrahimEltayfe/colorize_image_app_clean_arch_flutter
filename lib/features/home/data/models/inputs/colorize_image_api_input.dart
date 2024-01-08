import 'package:dio/dio.dart';

class ColorizeImageApiInput{
  final MultipartFile file;
  final String sync;
  final String returnType;

  ColorizeImageApiInput({required this.file, required this.sync, required this.returnType});

  Map<String, dynamic> toMap(){
    return {
      "file" : file,
      "sync" : sync,
      "return_type" : returnType
    };
  }
}