import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';

abstract class ColorizeImageRepository{
  Future<ColorizedImageEntity> generateColorizedImage(ColorizeImageInput input);
}