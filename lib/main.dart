import 'package:demo_app/screens/categories.dart';
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: login(),
      routes: {
        '/login': (context)=>login(),
        '/register':(context)=>register(),
        '/categories':(context)=>Categories(),
      },
    );
  }
}
