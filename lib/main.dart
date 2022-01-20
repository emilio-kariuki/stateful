import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: Ninja(),
  ));
}

class Ninja extends StatefulWidget {
  Ninja({Key? key}) : super(key: key);

  @override
  _NinjaState createState() => _NinjaState();
}

class _NinjaState extends State<Ninja> with TickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  int counter = 0;
  Color back = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "Android GDSC",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blueAccent[900],
        elevation: 5.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          IconButton(
            icon: AnimatedIcon(
                icon: AnimatedIcons.list_view, progress: controller),
            onPressed: () {
              setState(() {
                expanded ? controller.forward() : controller.reverse();
                expanded = !expanded;
              });
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (back == Colors.white) {
                  back = Colors.red;
                } else if (back == Colors.red) {
                  back = Colors.white;
                }
              });
            },
            icon: Icon(Icons.favorite, color: back),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/coode.jpg"),
                radius: 40,
              ),
            ),
            Divider(
              height: 90,
              // thickness: 10,
              color: Colors.grey[350],
            ),
            Text(
              "NAME: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Emilio Kariuki",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "CURRENT ANDROID LEVEL: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$counter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 20.0,
              ),
            ),
            Divider(
              height: 90,
              // thickness: 10,
              color: Colors.grey[350],
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  size: 20.0,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "emilio113kariuki@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
