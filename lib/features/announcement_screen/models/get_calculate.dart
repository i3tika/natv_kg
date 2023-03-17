// To parse this JSON data, do
//
//     final getCalculate = getCalculateFromJson(jsonString);

import 'dart:convert';

GetCalculate getCalculateFromJson(String str) => GetCalculate.fromJson(json.decode(str));

String getCalculateToJson(GetCalculate data) => json.encode(data.toJson());

class GetCalculate {
    GetCalculate({
        required this.channelId,
        required this.daysCount,
        required this.price,
        required this.priceWithDiscount,
        required this.text,
    });

    int channelId;
    int daysCount;
    int price;
    int priceWithDiscount;
    String text;

    factory GetCalculate.fromJson(Map<String, dynamic> json) => GetCalculate(
        channelId: json["channelId"],
        daysCount: json["daysCount"],
        price: json["price"],
        priceWithDiscount: json["priceWithDiscount"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "daysCount": daysCount,
        "price": price,
        "priceWithDiscount": priceWithDiscount,
        "text": text,
    };
}
