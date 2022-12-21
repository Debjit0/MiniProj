import 'package:flutter/material.dart';
import 'package:mini_proj_expense/models/database_provider.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';

class CategoryFetcher extends StatefulWidget {
  const CategoryFetcher({super.key});

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher> {
  late Future _categoryList;
  Future _getCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchCategories();
  }

  @override
  void initState() {
    super.initState();
    //fetch the list and set it to _CategoryList
    _categoryList = _getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //if connection is done then check for results and wait for results
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Consumer<DatabaseProvider>(
              builder: (_, db, __) {
                //get the categories
                var list = db.categories;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) => ListTile(
                    title: Text(list[i].title),
                  ),
                );
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
