abstract class Failure{
  final String message;
  const Failure(this.message);
}

class UnExpectedFailure extends Failure{
  const UnExpectedFailure(super.message);
}

class ServerFailure extends Failure{
  final int? code;
  const ServerFailure(super.message,{this.code});
}

class NoInternetFailure extends Failure{
  const NoInternetFailure() : super("No internet");
}

class CouldNotSaveImageFailure extends Failure{
  const CouldNotSaveImageFailure() : super("Could not save image to the gallery");
}
