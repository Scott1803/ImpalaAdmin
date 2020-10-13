class TitleSuggestion {
  String title;
  int votes;
  bool isSelected;

  TitleSuggestion({this.title, this.votes, this.isSelected});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['votes'] = this.votes;
    data['is_selected'] = this.isSelected;
    return data;
  }

  TitleSuggestion.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    votes = json['votes'];
    isSelected = json['is_selected'];
  }
}
