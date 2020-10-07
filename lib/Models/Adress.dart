class Adress {
  int adressId;
  String streetName;
  String houseNumber;
  String postCode;
  String city;
  String country;

  Adress(
      {this.adressId,
      this.streetName,
      this.houseNumber,
      this.postCode,
      this.city,
      this.country});

  Adress.fromJson(Map<String, dynamic> json) {
    adressId = json['adress_id'];
    streetName = json['street_name'];
    houseNumber = json['house_number'];
    postCode = json['post_code'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress_id'] = this.adressId;
    data['street_name'] = this.streetName;
    data['house_number'] = this.houseNumber;
    data['post_code'] = this.postCode;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}
