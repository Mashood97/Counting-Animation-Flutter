import 'package:counting_animation/counting_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Counting Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Counting Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'A simple counting animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CountingAnimation(
              beginValue: 0.0,
              endValue: 50.35,
              smallValueStyle: TextStyle(color: Colors.red, fontSize: 18.0),
              largeValueStyle: TextStyle(color: Colors.red, fontSize: 24.0),
              suffix: '%',
              curve: Curves.decelerate,
              duration: Duration(seconds: 5),
            ),
          ],
        ),
      ),
    );
  }
}
