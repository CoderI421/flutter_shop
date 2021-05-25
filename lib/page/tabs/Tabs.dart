import 'package:flutter/material.dart';
import 'User.dart';
import 'Cart.dart';
import 'Category.dart';
import 'Home.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 初始显示哪一个bottom bar
  int _currentIndex = 1;
  // list中的顺序不能表，要和navigation bar中的顺序一样
  List _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的商城'),
      ),
      // 主体内容区域
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 设置当前导航栏
        currentIndex: this._currentIndex,
        // 底部导航栏的点击事件
        onTap: (index) => {
          setState(() {
            this._currentIndex = index;
          })
        },
        // 底部导航栏如果超过两个，则需要设置，fixed可以变成多个底部导航栏
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: '购物车'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
        ],
      ),
    );
  }
}
