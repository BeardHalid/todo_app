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

/*Future<void> addTodo(String text) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async{
      await b.setTodo(text);
      return b.getTodos("true");
    },);
  }

  Future<void> updateTodo(String id, String checked) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async{
      await b.updateTodo(id, checked);
      return b.getTodos("true");
    },);
  }

  Future<void> deleteTodo(String id) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async{
      await b.deleteTodo(id);
      return b.getTodos("true");
    },);
  }
}*/
}

final doneTodoNotifierProvider =
    AsyncNotifierProvider<DoneTodoProvider, List<Todo>>(() {
  return DoneTodoProvider();
});
