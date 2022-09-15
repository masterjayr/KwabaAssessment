import 'package:get_storage/get_storage.dart';

class LocalStorageData {
  var store = GetStorage();
  setValue({String? key, dynamic data}) async {
    await store.write(key!, data);
  }

  deleteAll() async {
    await store.erase();
  }

  Future<dynamic> getValue({key}) async {
    return await store.read(key);
  }

  deleteOne({String? key}) async {
    await store.remove(key!);
  }
}
