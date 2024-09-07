// To parse this JSON data, do
//
//     final QrcodeModel = QrcodeModelFromJson(jsonString);

import 'dart:convert';

QrcodeModel QrcodeModelFromJson(String str) => QrcodeModel.fromJson(json.decode(str));

String QrcodeModelToJson(QrcodeModel data) => json.encode(data.toJson());

class QrcodeModel {
  String? qrcode;

  QrcodeModel({
    this.qrcode,

  });

  factory QrcodeModel.fromJson(Map json) => QrcodeModel(
    qrcode: json["qrcode"],
  );

  Map<String, dynamic> toJson() => {
    "qrcode": qrcode,
  };
}
