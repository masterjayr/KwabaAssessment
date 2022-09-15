// Incase of General Exceptions within the app
class GeneralException implements Exception {
  final dynamic message;

  GeneralException({this.message}) : super();
}

// Incase of Network Exceptions
class NetworkException implements Exception {
  final String? message;

  NetworkException({this.message});
}
