import 'package:flutter/material.dart';
import 'package:learning1/202/cache/shared_manager.dart';
import 'package:learning1/202/cache/user.dart';
import 'package:learning1/202/cache/user_cache/user_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStateful<SharedLearn> {
  late final SharedPreferences prefs;
  int _currentValue = 0;
  late final SharedManager _manager;
  late final UserCacheManager _userCacheManager;

  @override
  initState() {
    super.initState();
    _manager = SharedManager();
    initManager();
    _userCacheManager = UserCacheManager(_manager);
  }

  Future<void> initManager() async {
    changeLoading();
    await _manager.init();
    onChanged(_manager.getInt(SharedKeys.counter.name).toString());
    changeLoading();
  }

  onChanged(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? const SizedBox.shrink()
              : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _saveButton(),
          _deleteButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => onChanged(value),
          ),
          Expanded(
            child: UserListView(),
          )
        ],
      ),
    );
  }

  FloatingActionButton _saveButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _manager.saveInt(SharedKeys.counter.name, _currentValue);
        onChanged(_manager.getInt(SharedKeys.counter.name).toString());
        _userCacheManager.saveItems(UserItem().users);
      },
    );
  }

  FloatingActionButton _deleteButton() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () async {
        _manager.removeItem(SharedKeys.counter.name);
        print(_userCacheManager.getUsers());
      },
    );
  }
}

class UserListView extends StatelessWidget {
  UserListView({
    super.key,
  });

  final List<User> _users = UserItem().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_users[index].name ?? ''),
              subtitle: Text(_users[index].description ?? ''),
              trailing: Text(_users[index].url ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(decoration: TextDecoration.underline)),
            ),
          );
        });
  }
}

abstract class LoadingStateful<T extends SharedLearn> extends State<T> {
  bool isLoading = true;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

enum SharedKeys { counter, users }

class UserItem {
  late final List<User> users;
  UserItem() {
    users = [
      User(
        "Gul",
        "description1",
        "vb10.dev",
      ),
      User(
        "Gul2",
        "description2",
        "vb10.dev",
      ),
      User(
        "Gul3",
        "description3",
        "vb10.dev",
      ),
    ];
  }
}
