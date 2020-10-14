import 'package:ImpalaAdmin/New%20Models/BackgroundMediaSuggestion.dart';
import 'package:ImpalaAdmin/New%20Models/DescriptiveTag.dart';
import 'package:ImpalaAdmin/New%20Models/HeadTags.dart';
import 'package:ImpalaAdmin/New%20Models/Rating.dart';
import 'package:ImpalaAdmin/New%20Models/TitleSuggestion.dart';

class PlaceEditingData {
  List<TitleSuggestion> titleSuggestions;
  Rating ratingData;
  List<HeadTag> headTags;
  List<DescriptiveTag> descriptiveTagSuggestions;
  List<BackgroundMediaSuggestion> backgroundMediaSuggestions;

  PlaceEditingData(
      {this.titleSuggestions,
      this.ratingData,
      this.headTags,
      this.descriptiveTagSuggestions,
      this.backgroundMediaSuggestions});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.titleSuggestions != null) {
      data['title_suggestions'] =
          this.titleSuggestions.map<Map<String, dynamic>>((e) => e.toJson());
    }
    data['rating_data'] = this.ratingData.toJson();
    if (this.headTags != null) {
      data['head_tags'] =
          this.headTags.map<Map<String, dynamic>>((e) => e.toJson());
    }
    if (this.descriptiveTagSuggestions != null) {
      data['descriptive_tag_suggestions'] = this
          .descriptiveTagSuggestions
          .map<Map<String, dynamic>>((e) => e.toJson());
    }
    if (this.backgroundMediaSuggestions != null) {
      data['background_media_suggestions'] = this
          .backgroundMediaSuggestions
          .map<Map<String, dynamic>>((e) => e.toJson());
      return data;
    }
  }

  PlaceEditingData.fromJson(Map<String, dynamic> json) {
    titleSuggestions = (json['title_suggestions'] as Iterable)
        .map<TitleSuggestion>((e) => TitleSuggestion.fromJson(e))
        .toList();
    ratingData = Rating.fromJson(json['rating_data']);
    headTags = (json['head_tags'] as Iterable)
        .map<HeadTag>((e) => HeadTag.fromJson(e))
        .toList();
    descriptiveTagSuggestions =
        (json['descriptive_tag_suggestions'] as Iterable)
            .map<DescriptiveTag>((e) => DescriptiveTag.fromJson(e))
            .toList();
    backgroundMediaSuggestions =
        (json['background_media_suggestions'] as Iterable)
            .map<BackgroundMediaSuggestion>(
                (e) => BackgroundMediaSuggestion.fromJson(e))
            .toList();
  }
}
