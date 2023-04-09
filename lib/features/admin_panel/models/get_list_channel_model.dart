// To parse this JSON data, do
//
//     final getListChannel = getListChannelFromJson(jsonString);

import 'dart:convert';

List<GetListChannel> getListChannelFromJson(String str) =>
    List<GetListChannel>.from(
        json.decode(str).map((x) => GetListChannel.fromJson(x)));

String getListChannelToJson(List<GetListChannel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListChannel {
  GetListChannel({
    required this.id,
    required this.channelName,
    required this.logo,
    required this.pricePerLetter,
    required this.discounts,
  });

  dynamic id;
  dynamic channelName;
  dynamic logo;
  dynamic pricePerLetter;
  List<Discount> discounts;

  factory GetListChannel.fromJson(Map<String, dynamic> json) => GetListChannel(
        id: json["id"],
        channelName: json["channelName"],
        logo: json["logo"],
        pricePerLetter: json["pricePerLetter"],
        discounts: List<Discount>.from(
            json["discounts"].map((x) => Discount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "channelName": channelName,
        "logo": logo,
        "pricePerLetter": pricePerLetter,
        "discounts": List<dynamic>.from(discounts.map((x) => x.toJson())),
      };
}

class Discount {
  Discount({
    required this.discount,
    this.fromDaysCount,
  });

  int discount;
  int? fromDaysCount;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        discount: json["discount"],
        fromDaysCount: json["fromDaysCount"],
      );

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "fromDaysCount": fromDaysCount,
      };
}
