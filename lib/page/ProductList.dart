import 'package:flutter/material.dart';
import '../services/ScreenAdaper.dart';

class ProductListPage extends StatefulWidget {
  // 接收路径跳转时传过来的参数
  Map arguments;
  ProductListPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
// 将Scaffold 命名，然后将此页面的Scaffold的key命名为  _scaffoldKey 以便控制bar等
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
// 顶部导航组件

  Widget _subHearderWidget() {
    // 试用flex布局 通过height调样式间距离
    return Positioned(
        top: 0,
        height: ScreenAdaper.height(80),
        width: ScreenAdaper.getScreenWidth(),
        child: Container(
          height: ScreenAdaper.height(80),
          width: ScreenAdaper.getScreenWidth(),
          // color: Colors.red,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
          // 里边用row包裹 Expanded 渲染排序条件
          child: Row(
            children: [
              Expanded(
                  // 充满自己的Expanded区域
                  flex: 1,
                  // 可点击的组件
                  child: InkWell(
                    onTap: () {},
                    // 使用padding,将text的容器面积扩增，达到点击整个按钮的效果
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdaper.height(18),
                          0, ScreenAdaper.height(18)),
                      child: Text(
                        '综合',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )),
              Expanded(
                  // 充满自己的Expanded区域
                  flex: 1,
                  // 可点击的组件
                  child: InkWell(
                    onTap: () {},
                    // 使用padding,将text的容器面积扩增，达到点击整个按钮的效果
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdaper.height(18),
                          0, ScreenAdaper.height(18)),
                      child: Text(
                        '销量',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Expanded(

                  // 充满自己的Expanded区域
                  flex: 1,
                  // 可点击的组件
                  child: InkWell(
                    onTap: () {},
                    // 使用padding,将text的容器面积扩增，达到点击整个按钮的效果
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdaper.height(18),
                          0, ScreenAdaper.height(18)),
                      child: Text(
                        '价格',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Expanded(
                  // 充满自己的Expanded区域
                  flex: 1,
                  // 可点击的组件
                  child: InkWell(
                    onTap: () {
                      // 全局变量可以不加 this
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    // 使用padding,将text的容器面积扩增，达到点击整个按钮的效果
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdaper.height(18),
                          0, ScreenAdaper.height(18)),
                      child: Text(
                        '筛选',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }

  // 商品列表组件
  Widget _productListWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: ScreenAdaper.height(80)),
      // 列表遍历方法
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            // 每一个元素解构 row + 横线， row左右两部分，左固定，右自适应
            return Column(
              children: [
                Row(
                  children: [
                    // 左侧图片部分
                    Container(
                      width: ScreenAdaper.width(180),
                      height: ScreenAdaper.height(180),
                      child: Image.network(
                          "https://www.itying.com/images/flutter/list2.jpg",
                          fit: BoxFit.cover),
                    ),
                    // 右侧部分文字 flex模式
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: ScreenAdaper.height(180),
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            // spaceBetween 两侧贴边，其余中间间隔平分
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // start 横向靠左
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "戴尔(DELL)灵越3670 英特尔酷睿i5 高性能 台式电脑整机(九代i5-9400 8G 256G)",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: ScreenAdaper.height(36),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //注意 如果Container里面加上decoration属性，这个时候color属性必须得放在BoxDecoration
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, 0.9),
                                    ),
                                    child: Text("4g"),
                                  ),
                                  Container(
                                    height: ScreenAdaper.height(36),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, 0.9),
                                    ),
                                    child: Text("126"),
                                  ),
                                ],
                              ),
                              Text(
                                "¥990",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                Divider()
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 封装的等比例宽高组件 需要初始化
    ScreenAdaper.init(context);
    return Scaffold(
        // 给Scaffold 命名 方便控制 bar, drawer等
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('商品列表'),
          // 取消顶部导航栏的默认图标 将触发功能挪到 筛选按钮上
          // leading: Text(""),
          actions: [Text("")],
        ),
        // 顶部导航功能
        endDrawer: Drawer(
          child: Container(
            child: Text('顶部导航功能'),
          ),
        ),
        // 直接通过widget 可以获得继承类ProductListPage中的组件 不然需要传参继承
        // body: Text('${widget.arguments}'),
        // 试用 Stack 的flex布局，实现顶部筛选功能，不在 appbar中时通 bottom drawer 是因为没办事控制样式
        body: Stack(
          children: [_productListWidget(), _subHearderWidget()],
        ));
  }
}
