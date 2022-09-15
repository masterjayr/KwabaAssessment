// Abstractions

abstract class UserLocalRepositoryInterface {
  Future<Map<String, String>> getNormalHeader();
  Future<bool> get isNetworkConnected;
}
