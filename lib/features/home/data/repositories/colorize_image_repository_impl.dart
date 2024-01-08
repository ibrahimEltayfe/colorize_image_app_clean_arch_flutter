import 'package:colorize_image/core/utils/error_handling/failures.dart';
import 'package:colorize_image/features/home/data/data_sources/colorize_image_datasource.dart';
import 'package:colorize_image/features/home/data/mappers/colorize_image_mapper.dart';
import 'package:colorize_image/features/home/data/mappers/image_input_mapper.dart';
import 'package:colorize_image/features/home/data/models/image_response_model.dart';
import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';

class ColorizeImageRepositoryImpl implements ColorizeImageRepository{
  final ColorizeImageDataSource _colorizeImageDataSource;
  ColorizeImageRepositoryImpl(this._colorizeImageDataSource);

  @override
  Future<ColorizedImageEntity> getColorizedImage(ColorizeImageInput input) async{
    final response = await _colorizeImageDataSource.generateColorizedImage(await input.mapToApiInput());

    if(response.data == null){
      throw const ServerFailure("no data");
    }

    final imageResponseModel = ImageResponseModel.fromJson(response.data!);

    if(imageResponseModel.status != 200 && imageResponseModel.data != null){
      throw ServerFailure(imageResponseModel.message ?? '' , code: imageResponseModel.status);
    }

    return imageResponseModel.data!.mapToEntity();
  }

}