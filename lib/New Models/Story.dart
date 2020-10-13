import 'package:ImpalaAdmin/New%20Models/RecommendationOptions.dart';

class Story {
  String placeId;
  String description;
  String backgroundUrl;
  DateTime uploadDateTime;
  bool sponsored;
  RecommendationOptions recommendationOptions;

  Story(
      {this.placeId,
      this.description,
      this.backgroundUrl,
      this.uploadDateTime,
      this.sponsored,
      this.recommendationOptions});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['description'] = this.description;
    data['backgroundUrl'] = this.backgroundUrl;
    data['upload_datetime'] = this.uploadDateTime.millisecondsSinceEpoch;
    data['sponsored'] = this.sponsored;
    data['recommendation_options'] = this.recommendationOptions.toJson();
    return data;
  }

  Story.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    description = json['description'];
    backgroundUrl = json['backgroundUrl'];
    uploadDateTime =
        new DateTime.fromMillisecondsSinceEpoch(json['upload_datetime'] * 1000);
    sponsored = json['sponsored'];
    recommendationOptions =
        RecommendationOptions.fromJson(json['recommendation_options']);
  }
}
