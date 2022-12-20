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
    return Container();
  }
}
//21:35
