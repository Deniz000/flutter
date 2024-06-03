import 'dart:convert';

import 'package:learning1/202/cache/shared_manager.dart';
import 'package:learning1/202/cache/shared_preference_learn.dart';
import 'package:learning1/202/cache/user.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void saveItems(List<User> users) {
    //json aslında bir dizedir(string) bu kod da user's json formatında
    //bir String'e dönüştürür. Bizim de bu formatta string'e ihtiyacımız var.
    final _items =
        users.map((element) => jsonEncode(element.toJson())).toList();
    sharedManager.saveStringItems(SharedKeys.users.name, _items);
  }

  List<User>? getUsers() {
    final items = sharedManager.getStringItems(SharedKeys.users.name);
    //items?.isNotEmpty ifadesi null ise false döndürür.
    // şunun alternativi if (items != null && items.isNotEmpty)
    //null işe baacak bir şey yok false dön!
    if (items?.isNotEmpty ?? false) {
      return items!.map((element) {
        final jsonObject = jsonDecode(element);
        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
