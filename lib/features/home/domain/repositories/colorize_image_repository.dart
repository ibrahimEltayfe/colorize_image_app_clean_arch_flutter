import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input.dart';

abstract class ColorizeImageRepository{
  Future<ColorizedImageEntity> getColorizedImage(ColorizeImageInput input);
}