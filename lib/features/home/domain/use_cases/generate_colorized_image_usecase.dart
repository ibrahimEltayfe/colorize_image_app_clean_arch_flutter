import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';

class GenerateColorizedImageUseCase{
  final ColorizeImageRepository _colorizeImageRepository;
  GenerateColorizedImageUseCase(this._colorizeImageRepository);

  Future<ColorizedImageEntity> call(ColorizeImageInput input) async{
    return await _colorizeImageRepository.generateColorizedImage(input);
  }
}