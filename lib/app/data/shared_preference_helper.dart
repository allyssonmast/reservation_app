import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsHelper {
  final SharedPreferences sharedPreferences;

  SharedPrefsHelper(this.sharedPreferences);

  Future<void> saveDataToSharedPreferences<T>(String key, List<T> dataList) async {
    final List<String> stringList = dataList.map((item) => jsonEncode((item as dynamic).toJson())).toList();
    await sharedPreferences.setStringList(key, stringList);
  }

  List<T> getDataFromRemote<T>(
      String key,
      T Function(Map<String, dynamic>) fromJsonFunction,
      ) {
    final List<String>? listString = sharedPreferences.getStringList(key);
    if (listString != null) {
      return List<T>.from(listString.map((x) => fromJsonFunction(jsonDecode(x))));
    }
    return <T>[]; // Retorna uma lista vazia se não houver dados
  }
}
