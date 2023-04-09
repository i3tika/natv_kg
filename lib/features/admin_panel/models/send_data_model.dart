class SendDataModel {
  bool? active;
  int? channelId;
  String? channelName;
  List<Discounts>? discounts;
  String? logoPath;
  Price? price;

  SendDataModel(
      {this.active,
      this.channelId,
      this.channelName,
      this.discounts,
      this.logoPath,
      this.price});

  SendDataModel.fromJson(Map<String, dynamic> json) {
    // active = json['active'];
    channelId = json['channelId'];
    channelName = json['channelName'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
    logoPath = json['logoPath'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['channelId'] = this.channelId;
    data['channelName'] = this.channelName;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    data['logoPath'] = this.logoPath;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Discounts {
  int? discount;
  int? fromDaysCount;
  int? id;

  Discounts({this.discount, this.fromDaysCount, this.id});

  Discounts.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    fromDaysCount = json['fromDaysCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['fromDaysCount'] = this.fromDaysCount;
    data['id'] = this.id;
    return data;
  }
}

class Price {
  int? bannerPrice;
  int? id;
  int? pricePerLetter;

  Price({this.bannerPrice, this.id, this.pricePerLetter});

  Price.fromJson(Map<String, dynamic> json) {
    bannerPrice = json['bannerPrice'];
    id = json['id'];
    pricePerLetter = json['pricePerLetter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerPrice'] = this.bannerPrice;
    data['id'] = this.id;
    data['pricePerLetter'] = this.pricePerLetter;
    return data;
  }
}
