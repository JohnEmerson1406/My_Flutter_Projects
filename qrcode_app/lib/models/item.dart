// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.isDone,
    this.id,
    this.title,
    this.v,
  });

  bool isDone;
  String id;
  String title;
  int v;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        isDone: json["is_done"],
        id: json["_id"],
        title: json["title"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "is_done": isDone,
        "_id": id,
        "title": title,
        "__v": v,
      };
}
