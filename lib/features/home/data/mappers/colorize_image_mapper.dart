import 'dart:convert';

import 'package:colorize_image/features/home/data/models/image_response_model.dart';
import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';

extension ColorizeImageMapper on ColorizedImageModel{
  ColorizedImageEntity mapToEntity(){
    return ColorizedImageEntity(imageBytes: base64Decode(image??''));
  }
}