class Channel {
  int? id;
  String? channelName;
  String? logo;
  double? pricePerLetter;
  List<Map<String, dynamic>>? discounts;

  Channel(
      {this.id,
      this.channelName,
      this.logo,
      this.pricePerLetter,
      this.discounts});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      channelName: json['channelName'],
      logo: json['logo'],
      pricePerLetter: json['pricePerLetter'],
      discounts: List<Map<String, dynamic>>.from(json['discounts']),
    );
  }
}

List<Map<String, Channel>> data = [{}, {}];

List<Channel> channels = data.map((json) => Channel.fromJson(json)).toList();
