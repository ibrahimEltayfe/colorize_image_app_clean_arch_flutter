import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';

class GetColorizedImageUseCase{
  final ColorizeImageRepository _colorizeImageRepository;
  GetColorizedImageUseCase(this._colorizeImageRepository);

  Future<ColorizedImageEntity> call(ColorizeImageInput input) async{
    return _colorizeImageRepository.getColorizedImage(input);
  }
}
