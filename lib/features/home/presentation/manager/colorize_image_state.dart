part of 'colorize_image_cubit.dart';

abstract class ColorizeImageState extends Equatable {
  const ColorizeImageState();

  @override
  List<Object> get props => [];
}

class ColorizeImageInitial extends ColorizeImageState {}

class ColorizeImageLoading extends ColorizeImageState {}

class ColorizeImageSuccess extends ColorizeImageState {
  final Uint8List colorizedImageBytes;
  const ColorizeImageSuccess({required this.colorizedImageBytes});

  @override
  List<Object> get props => [colorizedImageBytes];
}

class ColorizeImageFailure extends ColorizeImageState {
  final String errorMessage;
  const ColorizeImageFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


