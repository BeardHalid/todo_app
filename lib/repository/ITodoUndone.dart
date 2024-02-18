import 'package:todo_app/repository/IBase.dart';

abstract class ITodoUndone implements IBase{
  Future<void> setTodo(String text);
  Future<void> updateTodo(int id, String checked);
  Future<void> deleteTodo(int id);
}