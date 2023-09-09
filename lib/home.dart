import 'package:flutter/material.dart';
import 'package:image_360/method1.dart';
import 'package:image_360/method2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Method1();
                },
              ));
            },
            child: Text("method 1"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Method2();
                },
              ));
            },
            child: Text("method 2"),
          ),
        ],
      ),
    );
  }
}
