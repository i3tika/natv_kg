class ChanelListModel {
  String? channelName;
  List<Discounts>? discounts;
  int? id;
  String? logo;
  int? pricePerLetter;

  ChanelListModel(
      {this.channelName,
      this.discounts,
      this.id,
      this.logo,
      this.pricePerLetter});

  ChanelListModel.fromJson(Map<String, dynamic> json) {
    channelName = json['channelName'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
    id = json['id'];
    logo = json['logo'];
    pricePerLetter = json['pricePerLetter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelName'] = this.channelName;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['pricePerLetter'] = this.pricePerLetter;
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
