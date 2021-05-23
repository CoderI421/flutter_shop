import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
// 视频选择封装，这里不封装了  直接用最新版本的
import '../../services/ScreenAdaper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 没有flutter_swiper 安全版本 运行需要运行这个flutter run --no-sound-null-safety

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 轮播图组件
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];
    return Container(
      child: AspectRatio(
        // AspectRatio 设定宽高比，不要设置指定高度，根据图片尺寸来，适配所有设备
        aspectRatio: 2 / 1,
        // Swiper轮播图组件 循环次数
        child: Swiper(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            // 返回图片
            return Image.network(imgList[index]['url'],
                // 设置图片充满容器
                fit: BoxFit.fill);
          },
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }

// 文本标题
  Widget _titleWidget(value) {
    return Container(
      height: ScreenAdaper.height(32),
      margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
      padding: EdgeInsets.only(left: ScreenAdaper.width(20)),
      decoration: BoxDecoration(
          // 边框属性
          border: Border(
              left: BorderSide(
                  color: Colors.red, width: ScreenAdaper.width(10)))),
      child: Text(
        value,
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  // 热门商品部分
  Widget _hotProductionListWidget() {
    return Container(
      height: ScreenAdaper.height(234),
      padding: EdgeInsets.all(ScreenAdaper.width(20)),
      // 使用竖排列表，然后改为横排
      child: ListView.builder(
          // 竖排列表改横排。
          scrollDirection: Axis.horizontal,
          // 循环数量
          itemCount: 10,
          // 循环体
          itemBuilder: (context, index) {
            // 每一个单元里边，是一个column
            return Column(
              children: [
                // 每一个column中分为两部分，图片为上，文字问下，为了控制尺寸，使用container包裹起来
                // 图片部分
                Container(
                  height: ScreenAdaper.height(140),
                  width: ScreenAdaper.width(140),
                  margin: EdgeInsets.only(right: ScreenAdaper.width(21)),
                  child: Image.network(
                    "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                    // 平铺容器
                    fit: BoxFit.cover,
                  ),
                ),
                // 文字部分
                Container(
                  padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
                  height: ScreenAdaper.height(44),
                  child: Text('第${index}条'),
                )
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return ListView(
      children: [
        _swiperWidget(),
        // 间隔
        SizedBox(height: ScreenAdaper.height(20)),
        _titleWidget('猜你喜欢'),
        // 滑动热门
        _hotProductionListWidget(),
        // 间隔
        SizedBox(height: ScreenAdaper.height(20)),
        _titleWidget('热门推荐'),
        SizedBox(height: ScreenAdaper.height(20)),
      ],
    );
  }
}
