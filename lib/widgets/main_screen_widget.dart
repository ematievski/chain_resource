import 'package:flutter/material.dart';
import 'chain_bar_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/main_screen/form');
  }

  double x = 1.56;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('цепь'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Center(
            child: ChainBarWidget(x: x),
          ),
          SizedBox(height: 20),
          _ChainListWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showForm(context),
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
  List<Widget> _listItems = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 8; i++) {
      _listItems.add(_ChainListRowWidget(indexInList: 1));
      SizedBox(height: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _listItems,
    );
  }
}

class _ChainListRowWidget extends StatelessWidget {
  final int indexInList;

  const _ChainListRowWidget({super.key, required this.indexInList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          width: MediaQuery.of(context).size.width - 30,
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
                  onPressed: () {
                    dialogMenu(context);
                  },
                  child: Icon(Icons.settings, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(6),
                    backgroundColor: Colors.white, // <-- Button color
                    foregroundColor: Colors.blue, // <-- Splash color
                  ),
                ),
              ),
              Positioned(
                  child: GestureDetector(
                onTap: () {
                  print('тук тук');
                },
                child: Container(
                  width: 300,
                  height: 40,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                ),
              ))
            ]),
          ),
          //width: 80,
          //width: MediaQuery.of(context).size.width - 25,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<dynamic> dialogMenu(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
              child: Text(
                "Выберите действие",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700),
              ),
            ),
            children: [
              SimpleDialogOption(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: const Text(
                      "установить эту цепь",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
              SimpleDialogOption(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: const Text(
                      "удалить цепь",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
              SizedBox(height: 20),
              SimpleDialogOption(
                  child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: const Text(
                      "назад",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
            ],
          );
        });
  }
}
