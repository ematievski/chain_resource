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
            width: MediaQuery.of(context).size.width - 30,
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
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return _ChainListRowWidget(
          indexInList: index,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 10,
          thickness: null,
          color: Colors.white,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 231, 240, 243),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              'цепь 2',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: -4,
            right: -11,
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.settings, color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(6),
                backgroundColor: Colors.white, // <-- Button color
                foregroundColor: Colors.blue, // <-- Splash color
              ),
            ),
          ),
        ]),
      ),
      //width: 80,
      //width: MediaQuery.of(context).size.width - 25,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     title: Text('текст'),
  //     trailing: Icon(Icons.settings),
  //   );
  // }
}
