import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class ProdctionModel {
  ProdctionModel({
    required this.result,
  });

  factory ProdctionModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProdctionItemModel>? result =
        jsonRes['result'] is List ? <ProdctionItemModel>[] : null;
    if (result != null) {
      for (final dynamic item in jsonRes['result']!) {
        if (item != null) {
          result.add(
              ProdctionItemModel.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return ProdctionModel(
      result: result!,
    );
  }

  List<ProdctionItemModel> result;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'result': result,
      };

  ProdctionModel clone() => ProdctionModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class ProdctionItemModel {
  ProdctionItemModel({
    required this.id,
    required this.title,
    required this.cid,
    required this.price,
    required this.oldPrice,
    required this.pic,
    required this.sPic,
  });

  factory ProdctionItemModel.fromJson(Map<String, dynamic> jsonRes) =>
      ProdctionItemModel(
        id: asT<String>(jsonRes['_id'])!,
        title: asT<String>(jsonRes['title'])!,
        cid: asT<String>(jsonRes['cid'])!,
        price: asT<Object>(jsonRes['price'])!,
        oldPrice: asT<String>(jsonRes['old_price'])!,
        pic: asT<String>(jsonRes['pic'])!,
        sPic: asT<String>(jsonRes['s_pic'])!,
      );

  String id;
  String title;
  String cid;
  Object price; //数据类型不能是 int 所以手动改成了 object //所有的类型都继承 Object
  String oldPrice;
  String pic;
  String sPic;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'title': title,
        'cid': cid,
        'price': price,
        'old_price': oldPrice,
        'pic': pic,
        's_pic': sPic,
      };

  ProdctionItemModel clone() => ProdctionItemModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
