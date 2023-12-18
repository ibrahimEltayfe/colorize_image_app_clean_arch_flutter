import 'package:colorize_image/core/config/injector/injector_config.dart';
import 'package:colorize_image/core/utils/services/dio_helper.dart';
import 'package:colorize_image/core/utils/services/network_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CommonDi {
  CommonDi._();

  static Future<void> initialize() async {
    injector.registerLazySingleton(() => DioHelper());
    injector.registerLazySingleton(() => InternetConnectionChecker());
    injector.registerLazySingleton(() => NetworkChecker(injector()));
  }
}
