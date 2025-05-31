import 'package:flutter/material.dart';

class TodoSolution extends StatefulWidget {
  const TodoSolution({super.key});

  @override
  State<TodoSolution> createState() => _TodoSolutionState();
}

class _TodoSolutionState extends State<TodoSolution> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("My Todos")),
      body:
          MyTodo.todos.isEmpty
              ? Center(child: Text("Nothing to do!"))
              : ListView.builder(
                itemCount: MyTodo.todos.length,
                itemBuilder: (context, index) {
                  final todo = MyTodo.todos[index];
                  return TodoItem(
                    todo: todo,
                    onchanged: (value) {
                      setState(() {
                        todo.completed = value;
                      });
                    },
                  );
                },
              ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setBuilderState) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: "What to do?"),
                      ),
                      Text("Select priority"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<TodoPriority>(
                            value: TodoPriority.Low,
                            groupValue: priority,
                            onChanged: (value) {
                              setBuilderState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(TodoPriority.Low.name),
                          Radio<TodoPriority>(
                            value: TodoPriority.Normal,
                            groupValue: priority,
                            onChanged: (value) {
                              setBuilderState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(TodoPriority.Normal.name),
                          Radio<TodoPriority>(
                            value: TodoPriority.High,
                            groupValue: priority,
                            onChanged: (value) {
                              setBuilderState(() {
                                priority = value!;
                              });
                            },
                          ),
                          Text(TodoPriority.High.name),
                        ],
                      ),
                      ElevatedButton(onPressed: _save, child: Text("SAVE")),
                    ],
                  ),
                ),
          ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMessage(context, "Input field must not be empty");
    }
    final todo = MyTodo(
      id: DateTime.now().millisecondsSinceEpoch,
      name: _controller.text,
      priority: priority,
    );
    MyTodo.todos.add(todo);
    _controller.clear();
    setState(() {
      Navigator.pop(context);
    });
  }
}

void showMessage(BuildContext context, String s) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text("Caution!"),
          content: Text(s),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("CLOSE"),
            ),
          ],
        ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onchanged;
  const TodoItem({super.key, required this.todo, required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todo.name),
      subtitle: Text("Priority: ${todo.priority.name}"),
      value: todo.completed,

      onChanged: (value) {
        onchanged(value!);
      },
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;
  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });
  static List<MyTodo> todos = [];
}

enum TodoPriority { Low, Normal, High }
