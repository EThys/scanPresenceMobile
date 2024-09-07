// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  String serie;
  String name;
  int price;
  String barcode;
  String qrcode;
  String eventName;
  String eventAddress;
  String eventDate;
  String eventEndDate;
  String eventCurrency;
  int eventId;

  TicketModel({
    required this.serie,
    required this.name,
    required this.price,
    required this.barcode,
    required this.qrcode,
    required this.eventName,
    required this.eventAddress,
    required this.eventDate,
    required this.eventEndDate,
    required this.eventCurrency,
    required this.eventId,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    serie: json["serie"],
    name: json["name"],
    price: json["price"],
    barcode: json["barcode"],
    qrcode: json["qrcode"],
    eventName: json["eventName"],
    eventAddress: json["eventAddress"],
    eventDate: json["eventDate"],
    eventEndDate: json["eventEndDate"],
    eventCurrency: json["eventCurrency"],
    eventId: json["eventId"],
  );

  Map<String, dynamic> toJson() => {
    "serie": serie,
    "name": name,
    "price": price,
    "barcode": barcode,
    "qrcode": qrcode,
    "eventName": eventName,
    "eventAddress": eventAddress,
    "eventDate": eventDate,
    "eventEndDate": eventEndDate,
    "eventCurrency": eventCurrency,
    "eventId": eventId,
  };
}
