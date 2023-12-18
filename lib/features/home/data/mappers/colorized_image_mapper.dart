import 'dart:convert';

import 'package:colorize_image/features/home/data/models/image_response_model.dart';
import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';

extension ColorizedImageMapper on ColorizedImageModel{
  ColorizedImageEntity mapToEntity(){
    return ColorizedImageEntity(base64Decode(image ?? ''));
  }
}