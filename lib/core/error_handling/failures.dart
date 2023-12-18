import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class UnExpectedFailure extends Failure{
  const UnExpectedFailure(super.message);
}

class ServerFailure extends Failure{
  final int? code;
  const ServerFailure(super.message,{this.code});

  @override
  List<Object?> get props => [...super.props, code];
}

class NoInternetFailure extends Failure{
  const NoInternetFailure() : super("No internet");
}

class CouldNotSaveImageFailure extends Failure{
  const CouldNotSaveImageFailure() : super("Could not save image to the gallery");
}
