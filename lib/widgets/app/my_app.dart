import 'package:flutter/material.dart';
import '../chain_form/chain_form_widget.dart';
import '../chains/chains_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ДЕМО',
      routes: {
        '/chains': (context) => Chains(),
        '/chains/form': (context) => const ChainFormWidget(),
      },
      initialRoute: '/chains',
    );
  }
}
