import 'package:learning1/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  Future<void> init() async {
    print("geldi");
    preferences = await SharedPreferences.getInstance();
  }

  void checkPreferences() {
    if (preferences == null) throw SharedNotInitializedException();
  }

  Future<bool> saveInt(String key, int value) async {
    checkPreferences();
    return (preferences?.setInt(key, value) ?? false);
  }

  Future<bool> saveStringItems(String key, List<String> value) async {
    checkPreferences();
    return (preferences?.setStringList(key, value) ?? false);
  }

  int? getInt(String key) {
    checkPreferences();
    return preferences?.getInt(key);
  }

  List<String>? getStringItems(String key) {
    checkPreferences();
    return preferences?.getStringList(key);
  }

  Future<bool> removeItem(String key) async {
    checkPreferences();
    return (preferences?.remove(key) ?? false);
  }
}
