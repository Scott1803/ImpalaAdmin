class TagType {
  int typeId;
  String name;

  TagType({this.typeId, this.name});

  TagType.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    return data;
  }
}
