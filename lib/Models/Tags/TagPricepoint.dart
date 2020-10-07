class TagPricepoint {
  int pricepointId;
  String name;

  TagPricepoint({this.pricepointId, this.name});

  TagPricepoint.fromJson(Map<String, dynamic> json) {
    pricepointId = json['pricepoint_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pricepoint_id'] = this.pricepointId;
    data['name'] = this.name;
    return data;
  }
}
