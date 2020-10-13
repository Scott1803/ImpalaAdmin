import 'package:ImpalaAdmin/New Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New Models/HeadTags.dart';

class RecommendationOptions {
  double south;
  double west;
  double north;
  double east;

  List<HeadTag> matchingHeadTags;
  List<DescriptiveTag> matchingDescriptiveTags;

  DateTime startTime;
  DateTime endTime;

  RecommendationOptions({
    this.south,
    this.west,
    this.north,
    this.east,
    this.matchingHeadTags,
    this.matchingDescriptiveTags,
    this.startTime,
    this.endTime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['south'] = this.south;
    data['west'] = this.west;
    data['north'] = this.north;
    data['east'] = this.east;
    if (this.matchingHeadTags != null) {
      data['matching_head_tags'] =
          this.matchingHeadTags.map<Map<String, dynamic>>((e) => e.toJson());
    }
    if (this.matchingDescriptiveTags != null) {
      data['matching_descriptive_tags'] = this
          .matchingDescriptiveTags
          .map<Map<String, dynamic>>((e) => e.toJson());
    }
    data['start_time'] = this.startTime.millisecondsSinceEpoch;
    data['end_time'] = this.endTime.millisecondsSinceEpoch;
    return data;
  }

  RecommendationOptions.fromJson(Map<String, dynamic> json) {
    south = json['south'];
    west = json['west'];
    north = json['north'];
    east = json['east'];
    matchingHeadTags = (json['matching_head_tags'] as Iterable)
        .map<HeadTag>((e) => HeadTag.fromJson(e))
        .toList();
    matchingDescriptiveTags = (json['descriptive_tags'] as Iterable)
        .map<DescriptiveTag>((e) => DescriptiveTag.fromJson(e))
        .toList();
    startTime =
        new DateTime.fromMillisecondsSinceEpoch(json['start_time'] * 1000);
    endTime = new DateTime.fromMillisecondsSinceEpoch(json['end_time'] * 1000);
  }
}
