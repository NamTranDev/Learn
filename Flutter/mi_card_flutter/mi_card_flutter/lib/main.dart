import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://i2.wp.com/twinfinite.net/wp-content/uploads/2019/11/Final-Fantasy-VII-Remake-Cloud-1.jpg?w=996&h=996&crop=1&ssl=1"),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"),
            ),
            Text(
              "Final Fantasy".toUpperCase(),
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.teal.shade100,
                  fontFamily: "SourceSansPro",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            SizedBox(
              width: 200,
              height: 20,
              child: Divider(
                color: Colors.teal.shade200,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text(
                  "+84 96 316 0906",
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "SourceSansPro",
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text(
                  "namtran09061992@gmail.com",
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: "SourceSansPro",
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
