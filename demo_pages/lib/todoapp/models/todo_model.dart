class Todo {
  final int id;
  String? text;
  bool isDone;

  Todo({
    required this.id,
    this.text,
    this.isDone = false,
  });

  static List<Todo> getList() {
    return [
      Todo(id: 1, text: "go to the market"),
      Todo(id: 2, text: "go to the school"),
      Todo(id: 3, text: "go to the mosque"),
      Todo(id: 4, text: "go to the house"),
      Todo(id: 5, text: "go to the cinema"),
    ];
  }
}
