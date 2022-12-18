import 'package:mini_proj_expense/constants/icons.dart';
import 'package:mini_proj_expense/models/ex_category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './ex_category.dart';

class DatabaseProvider {
  //stored in ram for holding Expense categories
  List<ExpenseCategory> _categories = [];
  List<ExpenseCategory> get categories => _categories;

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
      //this will add all the categories to the category table and initialise entries with 0 and total amount with 0
      for (int i = 0; i < icons.keys.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0).toString(),
        });
      }
    });
  }

  //method to fetch categories
  Future<List<ExpenseCategory>> fetchCategories() async {
    //get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((data) {
        //data is the fetched value
        //convert from Map<String, object> to Map<String,dynamic>
        final converted = List<Map<String, dynamic>>.from(data);
        //create a ExpenseCategory from every map in this converted variable
        List<ExpenseCategory> nList = List.generate(converted.length,
            (index) => ExpenseCategory.fromString(converted[index]));
        //set the values of categories to nlist
        _categories = nList;

        //return the categories
        return _categories;
      });
    });
  }
}
//13:39