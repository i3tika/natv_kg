class ChanelListModel {
  int? id;
  String? channelName;
  String? logo;
  int? pricePerLetter;
  List<Discounts>? discounts;

  ChanelListModel(
      {this.id,
      this.channelName,
      this.logo,
      this.pricePerLetter,
      this.discounts});

  ChanelListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelName = json['channelName'];
    logo = json['logo'];
    pricePerLetter = json['pricePerLetter'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channelName'] = this.channelName;
    data['logo'] = this.logo;
    data['pricePerLetter'] = this.pricePerLetter;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discounts {
  int? discount;
  int? fromDaysCount;

  Discounts({this.discount, this.fromDaysCount});

  Discounts.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    fromDaysCount = json['fromDaysCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['fromDaysCount'] = this.fromDaysCount;
    return data;
  }
}
