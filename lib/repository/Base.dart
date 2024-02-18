import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repository/IBase.dart';
import 'package:todo_app/sqlite/SqliteHelper.dart';

class Base implements IBase{
  final helper = SqliteHelper();
  @override
  Future<List<Todo>> getTodos(String checked) async{
    final db = await helper.openDb();
    final todoList = await db.rawQuery("Select * from Todo where checked = '$checked'");
    return List.generate(todoList.length, (index){
      final todo = Todo.fromJson(todoList[index]);
      return todo;
    });
  }
}