import '../New Models/Adress.dart';
import 'Tags/TagPricepoint.dart';
import 'Tags/TagStyle.dart';
import 'Tags/TagType.dart';
import 'Membership.dart';

class Place {
  int placeId;
  String placeString;
  String title;
  int descriptorArrayId;
  int tagTypeId;
  int tagStyleId;
  int tagPricepointId;
  bool ecAccepted;
  double latitude;
  double longitude;
  int adressId;
  String websiteUrl;
  String imageUrl;
  double averageUserrating;
  String yelpId;
  String partnerId;
  int membershipPlanId;
  String contactEmail;
  String osmAmenity;
  String osmCuisine;
  String tagline;
  Adress adress;
  Null membershipTypes;
  Null partner;
  TagPricepoint tagsPricepoint;
  TagStyle tagsStyle;
  TagType tagsType;

  Place(
      {this.placeId,
      this.placeString,
      this.title,
      this.descriptorArrayId,
      this.tagTypeId,
      this.tagStyleId,
      this.tagPricepointId,
      this.ecAccepted,
      this.latitude,
      this.longitude,
      this.adressId,
      this.websiteUrl,
      this.imageUrl,
      this.averageUserrating,
      this.yelpId,
      this.partnerId,
      this.membershipPlanId,
      this.contactEmail,
      this.osmAmenity,
      this.osmCuisine,
      this.tagline,
      this.adress,
      this.membershipTypes,
      this.partner,
      this.tagsPricepoint,
      this.tagsStyle,
      this.tagsType});

  Place.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    placeString = json['place_string'];
    title = json['title'];
    descriptorArrayId = json['descriptor_array_id'];
    tagTypeId = json['tag_type_id'];
    tagStyleId = json['tag_style_id'];
    tagPricepointId = json['tag_pricepoint_id'];
    ecAccepted = json['ec_accepted'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    adressId = json['adress_id'];
    websiteUrl = json['website_url'];
    imageUrl = json['image_url'];
    averageUserrating = json['average_userrating'];
    yelpId = json['yelp_id'];
    partnerId = json['partner_id'];
    membershipPlanId = json['membership_plan_id'];
    contactEmail = json['contact_email'];
    osmAmenity = json['osm_amenity'];
    osmCuisine = json['osm_cuisine'];
    tagline = json['tagline'];
    adress =
        json['Adress'] != null ? new Adress.fromJson(json['Adress']) : null;
    membershipTypes = json['Membership_Types'] != null
        ? new Membership.fromJson(json['Membership_Types'])
        : null;
    partner = json['Partner'];
    tagsPricepoint = json['Tags_Pricepoint'] != null
        ? new TagPricepoint.fromJson(json['Tags_Pricepoint'])
        : null;
    tagsStyle = json['Tags_Style'] != null
        ? new TagStyle.fromJson(json['Tags_Style'])
        : null;
    tagsType = json['Tags_Type'] != null
        ? new TagType.fromJson(json['Tags_Type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['place_string'] = this.placeString;
    data['title'] = this.title;
    data['descriptor_array_id'] = this.descriptorArrayId;
    data['tag_type_id'] = this.tagTypeId;
    data['tag_style_id'] = this.tagStyleId;
    data['tag_pricepoint_id'] = this.tagPricepointId;
    data['ec_accepted'] = this.ecAccepted;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['adress_id'] = this.adressId;
    data['website_url'] = this.websiteUrl;
    data['image_url'] = this.imageUrl;
    data['average_userrating'] = this.averageUserrating;
    data['yelp_id'] = this.yelpId;
    data['partner_id'] = this.partnerId;
    data['membership_plan_id'] = this.membershipPlanId;
    data['contact_email'] = this.contactEmail;
    data['osm_amenity'] = this.osmAmenity;
    data['osm_cuisine'] = this.osmCuisine;
    data['tagline'] = this.tagline;
    if (this.adress != null) {
      data['Adress'] = this.adress.toJson();
    }
    data['Membership_Types'] = this.membershipTypes;
    data['Partner'] = this.partner;
    if (this.tagsPricepoint != null) {
      data['Tags_Pricepoint'] = this.tagsPricepoint.toJson();
    }
    if (this.tagsStyle != null) {
      data['Tags_Style'] = this.tagsStyle.toJson();
    }
    if (this.tagsType != null) {
      data['Tags_Type'] = this.tagsType.toJson();
    }
    return data;
  }
}
