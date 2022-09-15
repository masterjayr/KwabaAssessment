import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kwaba_test/core/local_repository/local_repository_interface.dart';
import 'package:kwaba_test/core/local_storage.dart';

import '../exceptions/exception.dart';

// Basic Abstraction for Getting Device Token and headers required for Api Calls

class UserLocalRepositoryImpl implements UserLocalRepositoryInterface {
  final LocalStorageData localStorageData = LocalStorageData();

  @override
  Future<Map<String, String>> getNormalHeader() async {
    var header = <String, String>{};
    header['Content-type'] = "application/json";

    String token = await getToken();
    if (token.isNotEmpty) {
      header['Authorization'] = "Bearer $token";
    }
    return header;
  }

  // Abstraction for Getting stored Device Tokens, Not required in this test but just showing

  Future<String> getToken() async {
    var token = await localStorageData.getValue(key: "token");
    if (token != null) {
      return token;
    } else {
      throw GeneralException(message: "Could not retrieve user token");
    }
  }

  @override
  Future<bool> get isNetworkConnected async =>
      await InternetConnectionChecker().hasConnection;
}
