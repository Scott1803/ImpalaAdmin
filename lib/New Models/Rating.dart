class Rating {
  double ratingAverage;
  int amount;
  double ratingsAbsolute;

  Rating({this.ratingAverage, this.amount, this.ratingsAbsolute});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_average'] = this.ratingAverage;
    data['amount'] = this.amount;
    data['rating_absolute'] = this.ratingsAbsolute;
    return data;
  }

  Rating.fromJson(Map<String, dynamic> json) {
    ratingAverage = json['rating_average'];
    amount = json['amount'];
    ratingsAbsolute = json['rating_absolute'];
  }
}
