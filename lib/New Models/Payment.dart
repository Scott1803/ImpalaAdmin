class Payment {
  String name;
  bool accepted;

  Payment({this.name, this.accepted});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['accepted'] = this.accepted;
    return data;
  }

  Payment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accepted = json['accepted'];
  }
}
