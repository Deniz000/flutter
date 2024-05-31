import 'package:flutter/material.dart';
import 'package:learning1/202/state_manage/state_learn_view_model.dart';

class StateManageLearn extends StatefulWidget {
  const StateManageLearn({super.key});

  @override
  State<StateManageLearn> createState() => _StateManageLearnState();
}

class _StateManageLearnState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            isVisiable ? Colors.black : const Color.fromARGB(255, 179, 19, 19),
        shadowColor: isOpasity ? Colors.red : Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisibility();
          changeOpasity();
        },
      ),
    );
  }
}
