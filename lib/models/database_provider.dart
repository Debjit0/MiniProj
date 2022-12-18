import 'package:mini_proj_expense/constants/icons.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  Database? _database;

  Future<Database> get database async {
    //database directory
    final dbDirectory = await getDatabasesPath();

    //database name
    const dbName = 'expense_tc.db';

    //full path of db
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb, //will create this seperately
    );

    return _database!;
  }

  // _createDb method
  static const cTable = 'categoryTable';
  static const eTable = 'expenseTable';
  Future<void> _createDb(Database db, int version) async {
    //this method only runs on database creation
    await db.transaction((txn) async {
      //category table
      await txn.execute('''CREATE TABLE $cTable(
        title TEXT,
        entries INTEGER
        totalAmount TEXT
      )''');
      //expense table
      await txn.execute('''CREATE TABLE $eTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT
      )''');

      //insert the initial categories
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {'title': icons[i]});
      }
    });
  }
}
//13:39