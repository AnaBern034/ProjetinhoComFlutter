import 'package:crudprojeto/views/UserList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escola Brasil',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: Text('Body'),
      ),
      routes: {},
    );
  }
}
