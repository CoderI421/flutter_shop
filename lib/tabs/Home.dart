import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _swiperWidget(),
        // 间隔
        SizedBox(height: 10)
      ],
    );
  }
}
