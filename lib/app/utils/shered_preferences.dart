import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {

  void storeList(List<String> data, String value) async {
    List<String> strList = data.map((i) => i.toString()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(value, strList);
  }
}
