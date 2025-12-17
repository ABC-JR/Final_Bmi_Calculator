import 'package:bmi_calculator/data/local/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceStorage implements LocalStorage {
  final SharedPreferences prefs;

  SharedpreferenceStorage({required this.prefs});

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }



  Future<void> addToStringList(String key, String value) async {
    final List<String> oldList = getStringList(key) ?? [];
    oldList.add(value);
    await setStringList(key, oldList);
  }


  Future<void> removeFromStringList(String key, String value) async {
    final List<String> oldList = getStringList(key) ?? [];
    oldList.remove(value);
    await setStringList(key, oldList);
  }



  
  Future<void> addToString(String key, String value) async {
    String oldstr = getString(key) ?? "";
    oldstr =  oldstr + value;
    await setString(key, oldstr);
  }


 






  
}
