import 'package:flutter/material.dart';
import 'package:todo_app_api/view/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: RegisterScreen());
  }
}
