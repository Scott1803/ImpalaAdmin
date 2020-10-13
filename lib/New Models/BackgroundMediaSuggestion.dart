class BackgroundMediaSuggestion {
  String url;
  int votes;
  bool isSelected;

  BackgroundMediaSuggestion({this.url, this.votes, this.isSelected});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['votes'] = this.votes;
    data['is_selected'] = this.isSelected;
    return data;
  }

  BackgroundMediaSuggestion.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    votes = json['votes'];
    isSelected = json['is_selected'];
  }
}
