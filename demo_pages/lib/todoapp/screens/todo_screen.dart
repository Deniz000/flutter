import 'package:demo_pages/todoapp/constants/colors.dart';
import 'package:demo_pages/todoapp/models/todo_model.dart';
import 'package:demo_pages/todoapp/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<Todo> todos = Todo.getList();
  List<Todo> _foundToDo = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foundToDo = todos;
  }

  void filteredToDo(String searchText) {
    List<Todo> result = [];
    if (searchText.isNotEmpty) {
      result = todos
          .where((todo) => todo.text!.toLowerCase().contains(searchText))
          .toList();
    } else {
      todos;
    }
    setState(() {
      todos = result;
    });
  }

  void deleteItem(int id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
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
        title: const Text("TODO APP"),
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
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: darkCharcoal,
                              ),
                              hintText: "Search",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        )),
                    const Text(
                      "All ToDos",
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
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter text',
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 8),
                    child: FloatingActionButton(
                      backgroundColor: lightlishBlue,
                      onPressed: () {
                        addItem(_controller.text);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
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
