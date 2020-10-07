class Membership {
  int membershipId;
  String name;
  double price;

  Membership({this.membershipId, this.name, this.price});

  Membership.fromJson(Map<String, dynamic> json) {
    membershipId = json['membership_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['membership_id'] = this.membershipId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
