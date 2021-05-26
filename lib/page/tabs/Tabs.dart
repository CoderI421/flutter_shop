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
  // 方法3、AutomaticKeepAliveClientMixin 保持页面状态
  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    // 方法3、AutomaticKeepAliveClientMixin 保持页面状态
    this._pageController = PageController(initialPage: this._currentIndex);
  }

  // list中的顺序不能表，要和navigation bar中的顺序一样
  List<Widget> _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的商城'),
      ),
      // 方法1、主体内容区域 无法保持页面状态的写法 每次请求 重新加载
      // body: this._pageList[this._currentIndex],
      // 方法2、IndexedStack 保持页面状态的方法  这样的方法 有缺陷，上来一次性 将所有页面全部加载
      // body: IndexedStack(
      //   index: this._currentIndex,
      //   children: _pageList, // 返回的必须是 Widgte 列表  所以将 _pageList改为 Widget
      // ),
      // 方法3、AutomaticKeepAliveClientMixin 保持页面状态
      body: PageView(
        controller: _pageController,
        children: _pageList,
        // 页面改变重新渲染数据
        // onPageChanged: (){

        // },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 设置当前导航栏
        currentIndex: this._currentIndex,
        // 底部导航栏的点击事件
        onTap: (index) => {
          setState(() {
            this._currentIndex = index;
            // 方法3、AutomaticKeepAliveClientMixin 保持页面状态 使用 jumptopage跳转
            this._pageController.jumpToPage(index);
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
