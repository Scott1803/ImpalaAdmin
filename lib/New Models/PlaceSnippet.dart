import 'package:ImpalaAdmin/New%20Models/Adress.dart';
import 'package:ImpalaAdmin/New%20Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New%20Models/HeadTags.dart';

class PlaceSnippet {
  String placeId;
  String title;
  double rating;
  List<HeadTag> headTags;
  List<DescriptiveTag> descriptiveTags;
  Adress adress;
  String thumnailUrl;
  double latitude;
  double longitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['head_tags'] =
        this.headTags.map<Map<String, dynamic>>((e) => e.toJson());
    if (this.descriptiveTags != null) {
      data['descriptive_tags'] =
          this.descriptiveTags.map<Map<String, dynamic>>((e) => e.toJson());
    }
    if (this.adress != null) {
      data['Adress'] = this.adress.toJson();
    }
    data['thumnail_url'] = this.thumnailUrl;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  PlaceSnippet.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    title = json['title'];
    rating = json['rating'];
    headTags = (json['head_tags'] as Iterable)
        .map<HeadTag>((e) => HeadTag.fromJson(e))
        .toList();
    descriptiveTags = (json['descriptive_tags'] as Iterable)
        .map<DescriptiveTag>((e) => DescriptiveTag.fromJson(e))
        .toList();
    adress = Adress.fromJson(json['Adress']);
    thumnailUrl = json['thumnail_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
