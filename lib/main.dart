import 'package:flutter/material.dart';
import 'package:my_ids/theme.dart' as Theme;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.themeData,
      home: Center(child: Text("MY IDs"),),
    );
  }
}
