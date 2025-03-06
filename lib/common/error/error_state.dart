import 'package:workmate/common/error/enums.dart';

sealed class ErrorState<T> {
  final Exception? clientException;
  final Exception? parseError;
  final HttpException? httpError;
  final NetworkException? networkError;

  ErrorState({
    this.clientException,
    this.parseError,
    this.httpError,
    this.networkError,
  });
}

// implementation of error state class

class DataClientError<T> extends ErrorState<T> {
  DataClientError(Exception error) : super(clientException: error);
}

class DataParseError<T> extends ErrorState<T> {
  DataParseError(Exception error) : super(parseError: error);
}


class DataHttpError<T> extends ErrorState<T> {
  DataHttpError(HttpException error) : super(httpError: error);
}

class DataNetworkError<T> extends ErrorState<T> {
  DataNetworkError(NetworkException error) : super(networkError: error);
}

