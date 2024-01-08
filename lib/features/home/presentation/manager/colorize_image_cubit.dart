import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:colorize_image/core/utils/error_handling/failures_handler.dart';
import 'package:colorize_image/core/utils/injector/injector_config.dart';
import 'package:colorize_image/features/home/domain/entities/inputs/colorize_image_input.dart';
import 'package:colorize_image/features/home/domain/use_cases/get_colorized_image_usecase.dart';
import 'package:equatable/equatable.dart';

part 'colorize_image_state.dart';

class ColorizeImageCubit extends Cubit<ColorizeImageState> {
  late final GetColorizedImageUseCase _getColorizedImageUseCase;
  ColorizeImageCubit() : super(ColorizeImageInitial()){
    _getColorizedImageUseCase = injector();
  }
  
  void generateColorizedImage(ColorizeImageInput input) async{
    emit(ColorizeImageLoading());
    
    failuresHandler(() async{
      final colorizedImage = await _getColorizedImageUseCase(input);
      emit(ColorizeImageSuccess(colorizedImage.imageBytes));
    }, 
      onError: (failure) {
        emit(ColorizeImageFailure(errorMessage: failure.message));
      },
    );
  }
}
