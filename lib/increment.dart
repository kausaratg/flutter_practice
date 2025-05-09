import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

int index = 0;

class _CounterState extends State<Counter> {
  List images = [
    "assets/images/lake.jpg",
    "assets/images/lake2.jpg",
    "assets/images/lake3.jpg",
    "assets/images/lake4.jpg",
    "assets/images/lake5.jpg",
  ];

  void move() {
    setState(() {
      index++;
    });
  }

  void previous() {
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(images[index]),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      "Sundearbans",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: -30,
                  left: 0,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, size: 50, color: Colors.amber),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: ElevatedButton(
                   
                    onPressed: index == 0? null: () {
                      previous();
                    },
                    child: Text("Previous"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: index == (images.length -1) ? null:() {
                      move();
                    },
                    child: Text("Next"),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _headerSection(),
                  SizedBox(height: 16),
                  _navigationSection(),
                  SizedBox(height: 16),
                  _bodySection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodySection() {
    return Text(
      "Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the large Alphine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        // color: const Color.fromARGB(66, 22, 20, 20),
      ),
    );
  }

  Widget _navigationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _navigationItem(Icons.phone, "CALL"),
        _navigationItem(Icons.near_me, "ROUTE"),
        _navigationItem(Icons.share, "SHARE"),
      ],
    );
  }

  Widget _navigationItem(iconed, texts) {
    return Column(
      children: [
        Icon(iconed, color: Colors.lightBlueAccent),
        Text(texts, style: TextStyle(color: Colors.lightBlueAccent)),
      ],
    );
  }

  Widget _headerSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oeshinen Lake Compground",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              "kandersteg Switzerland",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),

        Spacer(),
        Row(children: [Icon(Icons.star, color: Colors.red), Text("41")]),
      ],
    );
  }
}
