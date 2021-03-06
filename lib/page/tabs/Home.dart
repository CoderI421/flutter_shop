// 引入配置文件
import 'package:flutter_shop/model/FocusModel.dart';
import '../../model/ProductionModel.dart';

import '../../config/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
// 将屏幕尺寸 封装到screenAdaper中
import '../../services/ScreenAdaper.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// 也可以使用 flutter http请求，但是这里使用了dio库进行网路请求
import 'package:dio/dio.dart';

// 没有flutter_swiper 安全版本 运行需要运行这个flutter run --no-sound-null-safety

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// 方法3、AutomaticKeepAliveClientMixin 保持页面状态 -> with AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 定义json数据响应变量
  List _focusData = [];
  List<ProdctionItemModel> _hotProductionData = [];
  List<ProdctionItemModel> _bestProductionData = [];

  // 方法3、AutomaticKeepAliveClientMixin 保持页面状态 -> with AutomaticKeepAliveClientMixin
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
// 生命周期函数，初始化加载
  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getHotProductionData();
    _getBestProductionData();
  }

// 请求轮播图数据接口
  _getFocusData() async {
    try {
      var api = '${Config.domain}api/focus';
      Response response = await Dio().get(api);
      var focusList = FocusModel.fromJson(response.data);
      setState(() {
        this._focusData = focusList.result!;
        // print(this._focusData);
      });
    } catch (e) {
      print(e);
    }
  }

// 请求猜你喜欢商品数据接口
  _getHotProductionData() async {
    try {
      var api = '${Config.domain}api/plist?is_hot=1';
      Response response = await Dio().get(api);
      var hotProductionList = ProdctionModel.fromJson(response.data);
      setState(() {
        this._hotProductionData = hotProductionList.result;
      });
    } catch (e) {
      print(e);
    }
  }

// 请求热门推荐数据接口
  _getBestProductionData() async {
    try {
      var api = '${Config.domain}api/plist?is_best=1';
      Response response = await Dio().get(api);
      var bestProductionList = ProdctionModel.fromJson(response.data);
      setState(() {
        this._bestProductionData = bestProductionList.result;
        print(this._bestProductionData);
      });
    } catch (e) {
      print(e);
    }
  }

  // 轮播图组件
  Widget _swiperWidget() {
    if (this._focusData.length > 0) {
      return Container(
        child: AspectRatio(
          // AspectRatio 设定宽高比，不要设置指定高度，根据图片尺寸来，适配所有设备
          aspectRatio: 2 / 1,
          // Swiper轮播图组件 循环次数
          child: Swiper(
            itemCount: _focusData.length,
            itemBuilder: (BuildContext context, int index) {
              String pic = this._focusData[index].pic;
              pic = Config.domain + pic.replaceAll('\\', '/');
              // 返回图片
              return Image.network('$pic',
                  // 设置图片充满容器
                  fit: BoxFit.fill);
            },
            pagination: SwiperPagination(),
            autoplay: true,
          ),
        ),
      );
    } else {
      return Container();
    }
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
          itemCount: this._hotProductionData.length,
          // 循环体
          itemBuilder: (context, index) {
            // 处理图片地址
            String sPic = Config.domain +
                this._hotProductionData[index].sPic.replaceAll('\\', '/');
            // pic = Config.domain + pic.replaceAll('\\', '/');
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
                    '$sPic',
                    // 平铺容器
                    fit: BoxFit.cover,
                  ),
                ),
                // 文字部分
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.height(30)),
                  padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
                  height: ScreenAdaper.height(44),
                  child: Text(
                    '￥${this._hotProductionData[index].price}',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            );
          }),
    );
  }

  // 推荐商品
  Widget _recProductionListWidget() {
    // 计算每个容器的宽度
    var itemWith = (ScreenAdaper.getScreenWidth() -
            2 * ScreenAdaper.width(20) -
            ScreenAdaper.width(10)) /
        2;
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenAdaper.width(20),
          ScreenAdaper.height(10),
          ScreenAdaper.width(20),
          ScreenAdaper.height(10)),
      // 网格设置
      child: Wrap(
        // 纵向间隔距离
        runSpacing: ScreenAdaper.height(10),
        // 横向间隔距离
        spacing: ScreenAdaper.width(10),
        // 使用map循环数组
        children: this._bestProductionData.map((e) {
          // 处理图片地址
          String sPic = Config.domain + e.sPic.replaceAll('\\', '/');
          // pic = Config.domain + pic.replaceAll('\\', '/');
          return Container(
              padding: EdgeInsets.all(10),
              width: itemWith,
              // 设置外边框
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
              child: Column(
                children: [
                  Container(
                    // 宽度自适应整个容器
                    width: double.infinity,
                    child: AspectRatio(
                      //设置图片宽高比 防止服务器返回的图片大小不一致导致高度不一致问题
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "$sPic",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 设置文字描述
                  Padding(
                    padding: EdgeInsets.only(top: ScreenAdaper.height(20)),
                    child: Text(
                      "${e.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  // 价格部分
                  Padding(
                    padding: EdgeInsets.only(top: ScreenAdaper.height(20)),
                    // 使用浮动功能 搭配align
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥${e.price}",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("¥${e.oldPrice}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  // 设置删除线设置
                                  decoration: TextDecoration.lineThrough)),
                        )
                      ],
                    ),
                  )
                ],
              ));
        }).toList(),
      ),
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
        _titleWidget('热门推荐'),
        // 推荐商品封装
        _recProductionListWidget(),
      ],
    );
  }
}
