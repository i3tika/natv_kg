class GetChanelId {
  int? channelId;
  String? channelName;
  String? logoPath;
  bool? active;
  Price? price;
  List<Discounts>? discounts;

  GetChanelId(
      {this.channelId,
      this.channelName,
      this.logoPath,
      this.active,
      this.price,
      this.discounts});

  GetChanelId.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    channelName = json['channelName'];
    logoPath = json['logoPath'];
    active = json['active'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['channelName'] = this.channelName;
    data['logoPath'] = this.logoPath;
    data['active'] = this.active;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  int? id;
  int? bannerPrice;
  int? pricePerLetter;

  Price({this.id, this.bannerPrice, this.pricePerLetter});

  Price.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerPrice = json['bannerPrice'];
    pricePerLetter = json['pricePerLetter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bannerPrice'] = this.bannerPrice;
    data['pricePerLetter'] = this.pricePerLetter;
    return data;
  }
}

class Discounts {
  int? id;
  int? discount;
  int? fromDaysCount;

  Discounts({this.id, this.discount, this.fromDaysCount});

  Discounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discount = json['discount'];
    fromDaysCount = json['fromDaysCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['discount'] = this.discount;
    data['fromDaysCount'] = this.fromDaysCount;
    return data;
  }
}
