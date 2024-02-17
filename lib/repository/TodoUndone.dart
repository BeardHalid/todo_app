import 'package:todo_app/repository/Base.dart';
import 'package:todo_app/repository/ITodoUndone.dart';

class TodoUndone extends Base implements ITodoUndone {
  @override
  Future<void> deleteTodo(String id) async {
    final db = await helper.openDb();
    await db.delete("Todo", where: "id=?", whereArgs: [id]);
  }

  @override
  Future<void> setTodo(String text) async {
    final db = await helper.openDb();
    await db.insert("Todo", {"text": text, "checked": "false"});
  }

  @override
  Future<void> updateTodo(String id, String checked) async {
    final db = await helper.openDb();
    db.update("Todo", {"checked": checked}, where: "id=?", whereArgs: [id]);
  }
}
