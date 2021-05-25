import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class FocusModel {
  FocusModel({
    this.result,
  });

  factory FocusModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<FocusItemModel>? result =
        jsonRes['result'] is List ? <FocusItemModel>[] : null;
    if (result != null) {
      for (final dynamic item in jsonRes['result']!) {
        if (item != null) {
          result.add(FocusItemModel.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return FocusModel(
      result: result,
    );
  }

  List<FocusItemModel>? result;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'result': result,
      };

  FocusModel clone() => FocusModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}

class FocusItemModel {
  FocusItemModel({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.url,
  });

  factory FocusItemModel.fromJson(Map<String, dynamic> jsonRes) =>
      FocusItemModel(
        id: asT<String?>(jsonRes['_id']),
        title: asT<String?>(jsonRes['title']),
        status: asT<String?>(jsonRes['status']),
        pic: asT<String?>(jsonRes['pic']),
        url: asT<String?>(jsonRes['url']),
      );

  String? id;
  String? title;
  String? status;
  String? pic;
  String? url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'title': title,
        'status': status,
        'pic': pic,
        'url': url,
      };

  FocusItemModel clone() => FocusItemModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
