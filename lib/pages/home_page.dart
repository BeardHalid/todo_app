import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_done.dart';
import 'package:todo_app/pages/todo_undone.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [TodoDone(), TodoUndone()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_rounded), label: 'Tamamlanmış'),
            BottomNavigationBarItem(
                icon: Icon(Icons.not_interested_rounded),
                label: 'Tamamlanmamış')
          ]),
    );
  }
}
