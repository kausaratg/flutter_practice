import 'package:flutter/material.dart';

enum TodoPriority { low, normal, high }

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TodoPriority priority = TodoPriority.normal;
  final nameController = TextEditingController();

  void _showModalWithState(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text("What too do "),
                      icon: Icon(Icons.book),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Select Priority"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _todoElement(setState, TodoPriority.low, "Low"),
                      _todoElement(setState, TodoPriority.normal, "Normal"),
                      _todoElement(setState, TodoPriority.high, "High"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,

                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("SAVE", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Row _todoElement(StateSetter setState, TodoPriority prior, String text1) {
    return Row(
      children: [
        Radio<TodoPriority>(
          value: prior,
          groupValue: priority,
          onChanged: (value) {
            setState(() {
              priority = value!;
            });
          },
        ),
        Text(text1),
      ],
    );
  }

  void addTodo() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My ToDos")),
        body: Center(child: Text("Nothing to do!")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModalWithState(context);
          },

          child: Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  TodoPriority priority;
  bool completed;

  MyTodo({
    required this.id,
    required this.name,
    required this.priority,
    this.completed = false,
  });

  static List<MyTodo> todos = [];
}
