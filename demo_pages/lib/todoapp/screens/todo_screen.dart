import 'package:demo_pages/todoapp/constants/colors.dart';
import 'package:demo_pages/todoapp/models/todo_model.dart';
import 'package:demo_pages/todoapp/strings/app_strings.dart';
import 'package:demo_pages/todoapp/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<Todo> todos = Todo.getList();
  final List<Todo> _foundTodos = Todo.getList();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  void filteredToDo(String searchText) {
    List<Todo> result = [];
    if (searchText.isNotEmpty) {
      result = _foundTodos
          .where((todo) => todo.text!.toLowerCase().contains(searchText))
          .toList();
    } else {
      result = _foundTodos; // burada orjinal listeyi kopyalıyor, bu yüzden 
      //sislinen öğeler görünmüyor, delete _found için de remove işlemi yapacağız
    }
    setState(() {
      todos = result;
    });
  }

  void deleteItem(int id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
      _foundTodos.removeWhere((todo) => todo.id == id);
    });
  }

  void addItem(String text) {
    int getId = todos.length + 1;
    setState(() {
      if (_controller.text.isNotEmpty) {
        todos.add(
          Todo(id: getId, text: text),
        );
        _controller.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: millionGrey,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 30,
          color: darkCharcoal,
        ),
        title: const Text(AppStrings.toDoApp),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: pagePaddingValue(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 50),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextField(
                          onChanged: (text) => filteredToDo(text),
                          controller: _searchController,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.search,
                                color: darkCharcoal,
                              ),
                              hintText: AppStrings.search,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        )),
                    const Text(
                      AppStrings.allToDos,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return TodoTile(
                            todo: todos[index],
                            onDelete: deleteItem,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: pagePaddingValue(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          )
                        ],),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: AppStrings.enterText,
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FloatingActionButton(
                      backgroundColor: lightlishBlue,
                      onPressed: () {
                        addItem(_controller.text);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  EdgeInsets pagePaddingValue() =>
      const EdgeInsets.symmetric(horizontal: 25, vertical: 20);
}
