import 'package:flutter/material.dart';
import 'chain_form/chain_form_widget.dart';
import 'main_screen_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ДЕМО',
      routes: {
        '/main_screen': (context) => MainScreen(),
        '/main_screen/form': (context) => const ChainFormWidget(),
      },
      initialRoute: '/main_screen',
      //home: MainScreen(),
    );
  }
}
