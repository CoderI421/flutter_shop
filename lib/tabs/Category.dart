import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [ElevatedButton(onPressed: () {}, child: Text('跳转到搜索'))],
      ),
    );
  }
}
