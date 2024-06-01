import 'package:flutter/material.dart';
import 'package:learning1/202/cache/shared_manager.dart';
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

  @override
  initState() {
    super.initState();
    _manager = SharedManager();
    initManager();
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
      body: TextField(
        onChanged: (value) => onChanged(value),
      ),
    );
  }

  FloatingActionButton _saveButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _manager.saveInt(SharedKeys.counter.name, _currentValue);
        onChanged(_manager.getInt(SharedKeys.counter.name).toString());
      },
    );
  }

  FloatingActionButton _deleteButton() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () async {
        _manager.removeItem(SharedKeys.counter.name);
      },
    );
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

enum SharedKeys { counter }
