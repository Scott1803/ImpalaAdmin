class TagStyle {
  int styleId;
  String name;

  TagStyle({this.styleId, this.name});

  TagStyle.fromJson(Map<String, dynamic> json) {
    styleId = json['style_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['style_id'] = this.styleId;
    data['name'] = this.name;
    return data;
  }
}
