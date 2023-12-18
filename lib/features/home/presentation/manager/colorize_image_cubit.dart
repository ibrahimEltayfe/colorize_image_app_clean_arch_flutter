import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:colorize_image/core/config/injector/injector_config.dart';
import 'package:colorize_image/core/error_handling/failure_handler.dart';
import 'package:colorize_image/features/home/domain/entities/colorized_image_entity.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input_entity.dart';
import 'package:colorize_image/features/home/domain/use_cases/generate_colorized_image_usecase.dart';
import 'package:equatable/equatable.dart';

part 'colorize_image_state.dart';

class ColorizeImageCubit extends Cubit<ColorizeImageState> {
  late final GenerateColorizedImageUseCase _generateColorizedImageUseCase;
  ColorizeImageCubit() : super(ColorizeImageInitial()){
    _generateColorizedImageUseCase = injector();
  }

  void generateColorizedImage(ColorizeImageInput imageInput) async{
    emit(ColorizeImageLoading());

    handleFailures(
      () async{
        final ColorizedImageEntity imageEntity = await _generateColorizedImageUseCase(imageInput);
        emit(ColorizeImageSuccess(colorizedImageBytes: imageEntity.imageBytes,));
      },
      onError: (failure){
        emit(ColorizeImageFailure(errorMessage: failure.message));
      }
    );

  }
}
