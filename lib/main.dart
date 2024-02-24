import 'package:tuly/post_method.dart';
import 'package:flutter/material.dart';
import 'list_api.dart';
import 'post_method.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: List_get_api(),
      ),
    );
  }
}