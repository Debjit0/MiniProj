import 'package:flutter/material.dart';

import '../widgets/categoryscreen/category_fetcher.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const name = '/category_screen'; //for routes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: CategoryFetcher(),
    );
  }
}
