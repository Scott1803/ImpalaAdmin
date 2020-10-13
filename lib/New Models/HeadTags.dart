class HeadTag {
  String name;
  int votesTrue;
  int votesFalse;

  HeadTag({this.name, this.votesFalse, this.votesTrue});

  HeadTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    votesTrue = json['votes_true'];
    votesFalse = json['votes_false'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['votes_true'] = this.votesTrue;
    data['votes_false'] = this.votesFalse;
    return data;
  }
}
