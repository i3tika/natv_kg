class CalculateModels {
  int? channelId;
  int? daysCount;
  int? price;
  int? priceWithDiscount;
  String? text;

  CalculateModels(
      {this.channelId,
      this.daysCount,
      this.price,
      this.priceWithDiscount,
      this.text});

  CalculateModels.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    daysCount = json['daysCount'];
    price = json['price'];
    priceWithDiscount = json['priceWithDiscount'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['daysCount'] = this.daysCount;
    data['price'] = this.price;
    data['priceWithDiscount'] = this.priceWithDiscount;
    data['text'] = this.text;
    return data;
  }
}