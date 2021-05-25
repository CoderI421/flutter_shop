import 'dart:ui';

import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    //注意用ScreenAdaper必须得在build方法里面初始化
    ScreenAdaper.init(context);

    //计算款高度等长度
    // 左侧宽度计算，占全屏的1/4
    var leftWidth = ScreenAdaper.getScreenWidth() / 4;
    //右侧每一项宽度=（总宽度-左侧宽度-GridView外侧元素左右的Padding值-GridView中间的间距）/3
    var rightItemWidth =
        (ScreenAdaper.getScreenWidth() - leftWidth - 20 - 20) / 3;

    // 使用适配宽高比计算插件计算出右侧每个单元宽度 这个和图片容器的高度相同
    rightItemWidth = ScreenAdaper.width(rightItemWidth);

    // 获取计算后的高度 图片高度+文字部分高度
    var rightItemHeight = rightItemWidth + ScreenAdaper.height(28);

    return Row(
      children: [
        // 左侧按钮集
        Container(
          width: leftWidth,
          // 纵向充满容器
          height: double.infinity,
          // color: Colors.blue,
          // 考虑到左侧类似于按钮，可以点击的 所以使用ListView 的builder 动态渲染

          child: ListView.builder(
              // 每一个单元是一个container + 一条线
              itemCount: 28,
              itemBuilder: (context, index) {
                // 每一个单元是一个列容器
                return Column(
                  children: [
                    // 让容器变成可点击的按钮类型 使用InkWell
                    InkWell(
                      // 点击事件
                      onTap: () {},
                      child: Container(
                        // 文字在容器中的位置
                        alignment: Alignment.center,
                        // 横向充满容器
                        width: double.infinity,
                        // 使用比例缩放后的计算宽度
                        height: ScreenAdaper.height(56),
                        child: Text(
                          '第${index}条',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // 横线
                    Divider()
                  ],
                );
              }),
        ),
        // 右侧网格
        Expanded(
            flex: 1,
            child: Container(
              // 这样的容器padding 可以不使用ScreenAdaper
              padding: EdgeInsets.all(10),
              height: double.infinity,
              color: Color.fromRGBO(240, 246, 246, 0.9),
              // 为了动态渲染右侧网格布局这里使用 builder 也可以使用
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // 每行分为三列
                      crossAxisCount: 3,
                      // 容器宽高比
                      childAspectRatio: rightItemWidth / rightItemHeight,
                      // 元素上下间距
                      crossAxisSpacing: 10,
                      // 元素左右间距
                      mainAxisSpacing: 10),
                  // 循环次数
                  itemCount: 18,
                  // 循环体
                  itemBuilder: (context, index) {
                    // 每个单位里边两部分 图片和文字
                    return Container(
                      child: Column(
                        children: [
                          // 图片宽高比容器 充满容器，前提，减去下部分的高度
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/list8.jpg",
                                fit: BoxFit.cover),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: ScreenAdaper.height(6)),
                            // 容器中，文字位置
                            alignment: Alignment.center,
                            height: ScreenAdaper.height(28),
                            child: Text('houhou'),
                          )
                        ],
                      ),
                    );
                  }),
            ))
      ],
    );
  }
}
