import 'package:colorize_image/core/error_handling/failures.dart';
import 'package:colorize_image/features/home/data/data_sources/colorize_image_data_source.dart';
import 'package:colorize_image/features/home/data/mappers/colorized_image_mapper.dart';
import 'package:colorize_image/features/home/data/mappers/image_input_mapper.dart';
import 'package:colorize_image/features/home/data/models/image_response_model.dart';
import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';
import 'package:dio/dio.dart';

class ColorizeImageRepositoryImpl implements ColorizeImageRepository{
  final ColorizeImageDataSource _colorizeImageDataSource;
  ColorizeImageRepositoryImpl(this._colorizeImageDataSource);

  @override
  Future<ColorizedImageEntity> generateColorizedImage(ColorizeImageInput input) async{
    final Response<Map<String,dynamic>?> response =
         await _colorizeImageDataSource.generateColorizedImage(await input.mapToApiInput());

    if(response.data == null){
      throw const ServerFailure("No data");
    } else if (response.statusCode != 200) {
      throw ServerFailure(response.statusMessage ?? "Server error", code: response.statusCode ?? 0);
    }

    final responseModel = ImageResponseModel.fromJson(response.data!);

    if(responseModel.status != 200){
      throw ServerFailure(responseModel.message ?? '', code: responseModel.status);
    }

    return responseModel.data!.mapToEntity();
    
  }
}