import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [ElevatedButton(onPressed: () {}, child: Text('跳转到搜索'))],
      ),
    );
  }
}
