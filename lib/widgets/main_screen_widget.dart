import 'package:flutter/material.dart';
import 'chain_bar_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  double x = 1.56;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('цепь'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: ChainBarWidget(x: x),
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            child: const _ChainListWidget(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    ));
  }
}

class _ChainListWidget extends StatefulWidget {
  const _ChainListWidget({super.key});

  @override
  State<_ChainListWidget> createState() => _ChainListWidgetState();
}

class _ChainListWidgetState extends State<_ChainListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return _ChainListRowWidget(
          indexInList: index,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
    );
  }
}

class _ChainListRowWidget extends StatelessWidget {
  final int indexInList;

  const _ChainListRowWidget({super.key, required this.indexInList});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('текст'),
      trailing: Icon(Icons.settings),
    );
  }
}
