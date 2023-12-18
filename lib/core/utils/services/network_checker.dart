import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkChecker(this.internetConnectionChecker);

  Future<bool> get hasConnection async => await internetConnectionChecker.hasConnection;
}