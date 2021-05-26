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
  @override
  Widget build(BuildContext context) {
    // 封装的等比例宽高组件 需要初始化
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      // 直接通过widget 可以获得继承类ProductListPage中的组件 不然需要传参继承
      // body: Text('${widget.arguments}'),
      body: Padding(
        padding: EdgeInsets.all(10),
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
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      //注意 如果Container里面加上decoration属性，这个时候color属性必须得放在BoxDecoration
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromRGBO(230, 230, 230, 0.9),
                                      ),
                                      child: Text("4g"),
                                    ),
                                    Container(
                                      height: ScreenAdaper.height(36),
                                      margin: EdgeInsets.only(right: 10),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromRGBO(230, 230, 230, 0.9),
                                      ),
                                      child: Text("126"),
                                    ),
                                  ],
                                ),
                                Text(
                                  "¥990",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
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
      ),
    );
  }
}
