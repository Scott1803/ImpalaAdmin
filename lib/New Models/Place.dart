import 'package:ImpalaAdmin/Models/Story.dart';
import 'package:ImpalaAdmin/New%20Models/Adress.dart';
import 'package:ImpalaAdmin/New%20Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New%20Models/HeadTags.dart';
import 'package:ImpalaAdmin/New%20Models/Payment.dart';
import 'package:ImpalaAdmin/New%20Models/PlaceEditingData.dart';
import 'package:ImpalaAdmin/New%20Models/PlaceSnippet.dart';
import 'package:ImpalaAdmin/services/ConversionService.dart';

class Place {
  String placeId;
  String title;
  Adress adress; //Map
  List<Payment> paymentTypes; //Map
  double latitude;
  double longitude;
  String websiteUrl;
  String backgroundUrl;
  String thumnailUrl;
  double rating;
  String yelpId;
  String contactEmail;
  String osmAmenity;
  String osmCuisine;
  List<Story> stories; //Sub collection -> Needs to be added seperately!!
  List<HeadTag> headTags; //Map
  List<DescriptiveTag>
      descriptiveTags; //Sub collection -> Needs to be added seperately!!
  PlaceSnippet snippet;
  PlaceEditingData editingData;

  Place({
    this.placeId,
    this.title,
    this.adress,
    this.paymentTypes,
    this.latitude,
    this.longitude,
    this.websiteUrl,
    this.backgroundUrl,
    this.thumnailUrl,
    this.rating,
    this.yelpId,
    this.contactEmail,
    this.osmAmenity,
    this.osmCuisine,
    this.stories,
    this.headTags,
    this.descriptiveTags,
    this.snippet,
    this.editingData,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['title'] = this.title;
    if (this.adress != null) {
      data['Adress'] = this.adress.toJson();
    }
    if (this.paymentTypes != null) {
      data['payment_types'] =
          this.paymentTypes.map<Map<String, dynamic>>((e) => e.toJson());
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.websiteUrl != null) data['website_url'] = this.websiteUrl;
    data['background_url'] = this.backgroundUrl;
    if (this.thumnailUrl != null) data['thumnail_url'] = this.thumnailUrl;
    if (this.rating != null) data['rating'] = this.rating;
    if (this.yelpId != null) data['yelp_id'] = this.yelpId;
    if (this.contactEmail != null) data['contact_email'] = this.contactEmail;
    data['osm_amenity'] = this.osmAmenity;
    data['osm_cuisine'] = this.osmCuisine;
    if (this.headTags != null)
      data['head_tags'] =
          this.headTags.map<Map<String, dynamic>>((e) => e.toJson());
    return data;
  }

  Place.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    title = json['title'];
    adress = ConversionService.mapToAdress(json['adress']);
    paymentTypes = (json['payment_types'] as Iterable)
        .map<Payment>((e) => Payment.fromJson(e))
        .toList();
    latitude = json['latitude'];
    longitude = json['longitude'];
    websiteUrl = json['website_url'];
    backgroundUrl = json['background_url'];
    thumnailUrl = json['thumnail_url'];
    rating = json['rating'];
    yelpId = json['yelp_id'];
    contactEmail = json['contact_email'];
    osmAmenity = json['osm_amenity'];
    osmCuisine = json['osm_cuisine'];
    headTags = (json['head_tags'] as Iterable)
        .map<HeadTag>((e) => HeadTag.fromJson(e))
        .toList();
  }
}
