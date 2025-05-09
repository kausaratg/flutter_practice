import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(1000, (index) => 'item ${index + 1}');
    return Scaffold(
      appBar: AppBar(title: Text("ListView Example")),
      body: ListView.builder(
        itemCount:items.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                tileColor: index.isEven ? Colors.blue[200] : Colors.blue[100],
                title: Text(items[index]),
                subtitle: Text("This is a subtitle ${index + 1}"),
              ),
            ),
      ),
    );
  }
}
