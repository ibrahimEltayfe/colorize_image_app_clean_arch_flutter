import 'package:colorize_image/core/config/injector/injector_config.dart';
import 'package:colorize_image/features/home/data/data_sources/colorize_image_data_source.dart';
import 'package:colorize_image/features/home/data/repositories/colorize_image_repository_impl.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';
import 'package:colorize_image/features/home/domain/use_cases/generate_colorized_image_usecase.dart';
import 'package:colorize_image/features/home/domain/use_cases/save_image_to_gallery_usecase.dart';

class HomeDi {
  HomeDi._();

  static Future<void> initialize() async {
    //Data sources
    injector.registerLazySingleton(() => ColorizeImageDataSource(injector()));
    
    //Repositories
    injector.registerLazySingleton<ColorizeImageRepository>(() => ColorizeImageRepositoryImpl(injector()));
    
    //UseCases
    injector.registerFactory(() => GenerateColorizedImageUseCase(injector()));
    injector.registerFactory(() => SaveImageToGalleryUseCase());
  }
}
