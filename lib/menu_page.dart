import 'package:flutter/material.dart';
import 'package:flutter_practice/counter_app.dart';
import 'package:flutter_practice/grid_view_example.dart';
import 'package:flutter_practice/increment.dart';
import 'package:flutter_practice/input_widget_example.dart';
import 'package:flutter_practice/list_view_example.dart';
import 'package:flutter_practice/todo_app.dart';
import 'package:flutter_practice/todo_solution.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter()),
                );
              },
              child: Text("Go Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewExample()),
                );
              },
              child: Text("List View Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewExample()),
                );
              },
              child: Text("Grid View Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterApp()),
                );
              },
              child: Text("Counter App Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputWidgetExample()),
                );
              },
              child: Text("Input Widget Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoApp()),
                );
              },
              child: Text("Todo App Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoSolution()),
                );
              },
              child: Text("Todo App Solution"),
            ),
          ],
        ),
      ),
    );
  }
}
