import 'package:flutter/material.dart';

enum Gender { male, female }

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExampleState();
}

class _InputWidgetExampleState extends State<InputWidgetExample> {
  final nameController = TextEditingController();
  bool isChecked = false;
  Gender gender = Gender.male;
  final countries = [
    "Australia",
    "Bangladesh",
    "Canada",
    "Denmark",
    "England",
    "France",
    "Greece",
  ];
  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Widget")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Enter your name"),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text("Ok"),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("flutter"),
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text("Male"),
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text("Female"),
              ],
            ),
            DropdownButton<String>(
              hint: Text("Select Your country"),
              isExpanded: true,
              value: country,
              items:
                  countries
                      .map(
                        (e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
