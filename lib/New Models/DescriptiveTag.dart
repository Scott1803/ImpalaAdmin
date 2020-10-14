class DescriptiveTag {
  String name;
  int votes;

  DescriptiveTag({this.name, this.votes});

  DescriptiveTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress_id'] = this.name;
    data['street_name'] = this.votes;
    return data;
  }
}
