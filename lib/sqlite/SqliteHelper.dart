import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper{
  static final SqliteHelper _instance = SqliteHelper._privateConstructor();

  Future<Database>? _db;

  Future<Database> openDb() async{
    return await _db!;
  }

  SqliteHelper._privateConstructor(){
    _db = _createTable();
  }

  factory SqliteHelper(){
    return _instance;
  }

  Future<Database> _createTable() async {
    const String db = "todo.db";
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, db);
    if(await databaseExists(path)){
      return await openDatabase(path);
    }else{
      return await openDatabase(path, version: 1 ,onCreate: (db, version) async {
         await db.execute("CREATE TABLE Todo (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, checked TEXT)");
      },);
    }
  }
}