import 'package:todo_app/models/todo.dart';

abstract class IBase{
  Future<List<Todo>> getTodos(String checked);
}