import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repository/TodoDone.dart';

class DoneTodoProvider extends AsyncNotifier<List<Todo>> {
  final b = TodoDone();

  @override
  FutureOr<List<Todo>> build() async {
    return b.getTodos("true");
  }
}

final doneTodoNotifierProvider =
    AsyncNotifierProvider<DoneTodoProvider, List<Todo>>(() {
  return DoneTodoProvider();
});
