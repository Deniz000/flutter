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

  int? getInt(String key) {
    checkPreferences();
    return preferences?.getInt(key);
  }

  Future<bool> removeItem(String key) async {
    checkPreferences();
    return (preferences?.remove(key) ?? false);
  }
}
