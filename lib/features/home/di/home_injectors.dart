import 'package:colorize_image/core/utils/injector/injector_config.dart';
import 'package:colorize_image/features/home/data/data_sources/colorize_image_datasource.dart';
import 'package:colorize_image/features/home/data/repositories/colorize_image_repository_impl.dart';
import 'package:colorize_image/features/home/domain/repositories/colorize_image_repository.dart';
import 'package:colorize_image/features/home/domain/use_cases/get_colorized_image_usecase.dart';

class HomeDi{
  HomeDi._();

  static void initialize(){
    //data sources
    injector.registerLazySingleton(() => ColorizeImageDataSource(injector()));
    
    //repositories
    injector.registerLazySingleton<ColorizeImageRepository>(() => ColorizeImageRepositoryImpl(injector()));

    //use case
    injector.registerFactory(() => GetColorizedImageUseCase(injector()));

  }

}
