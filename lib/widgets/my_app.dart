import 'package:flutter/material.dart';
import 'main_screen_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ДЕМО',
      routes: {'/main_screen': (context) => MainScreen()},
      initialRoute: '/main_screen',
      //home: MainScreen(),
    );
  }
}
