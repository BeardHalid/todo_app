import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repository/TodoUndone.dart';

class UndoneTodoProvider extends AsyncNotifier<List<Todo>> {
  final b = TodoUndone();

  @override
  FutureOr<List<Todo>> build() async {
    return b.getTodos("false");
  }

  Future<void> addTodo(String text) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await b.setTodo(text);
        return b.getTodos("false");
      },
    );
  }

  Future<void> updateTodo(int id, String checked) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await b.updateTodo(id, checked);
        return b.getTodos("false");
      },
    );
  }

  Future<void> deleteTodo(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await b.deleteTodo(id);
        return b.getTodos("false");
      },
    );
  }
}

final undoneTodoNotifierProvider =
    AsyncNotifierProvider<UndoneTodoProvider, List<Todo>>(() {
  return UndoneTodoProvider();
});
