import 'package:demo_pages/todoapp/constants/colors.dart';
import 'package:demo_pages/todoapp/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.onDelete,
  });
  final Todo todo;
  final Function onDelete;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  void changeState() {
    setState(() {
      widget.todo.isDone = !widget.todo.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () => changeState(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        leading: widget.todo.isDone
            ? const Icon(
                Icons.check_box,
                color: lightlishBlue,
              )
            : const Icon(
                Icons.check_box_outline_blank_sharp,
                color: lightlishBlue,
              ),
        title: Text('${widget.todo.text}',
            style: TextStyle(
              decoration:
                  widget.todo.isDone ? TextDecoration.lineThrough : null,
            )),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: redInferno,
          ),
          onPressed: () {
            setState(() {
              print("evet");
              widget.onDelete(widget.todo.id);
              print("oldu");
            });
            print("silindi");
          },
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
