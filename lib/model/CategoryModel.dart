import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class CategoryModel {
  CategoryModel({
    this.result,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<CategoryItemModel>? result =
        jsonRes['result'] is List ? <CategoryItemModel>[] : null;
    if (result != null) {
      for (final dynamic item in jsonRes['result']!) {
        if (item != null) {
          result.add(
              CategoryItemModel.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return CategoryModel(
      result: result,
    );
  }

  List<CategoryItemModel>? result;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'result': result,
      };

  CategoryModel clone() => CategoryModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class CategoryItemModel {
  CategoryItemModel({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.pid,
    this.sort,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> jsonRes) =>
      CategoryItemModel(
        id: asT<String?>(jsonRes['_id']),
        title: asT<String?>(jsonRes['title']),
        status: asT<Object?>(jsonRes['status']),
        pic: asT<String?>(jsonRes['pic']),
        pid: asT<String?>(jsonRes['pid']),
        sort: asT<String?>(jsonRes['sort']),
      );

  String? id;
  String? title;
  Object? status;
  String? pic;
  String? pid;
  String? sort;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'title': title,
        'status': status,
        'pic': pic,
        'pid': pid,
        'sort': sort,
      };

  CategoryItemModel clone() => CategoryItemModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
