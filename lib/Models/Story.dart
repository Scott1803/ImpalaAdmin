class Story {
  String placeTitle;
  String description;
  String imageURL;
  bool played;

  Story(
      {this.placeTitle, this.description, this.imageURL, this.played = false});
}

List<Story> favoriten = [
  new Story(
      placeTitle: "Wellnitz",
      description: "Kochevent 12.09.",
      imageURL: "lib/Assets/Images/storiesPlaceholder/cooking.jpg",
      played: true),
  new Story(
    placeTitle: "Sitte",
    description: "Neue Abendkarte",
    imageURL: "lib/Assets/Images/storiesPlaceholder/food_menu.jpg",
  ),
  new Story(
    placeTitle: "Sansibar",
    description: "Donnerstag Cocktail Abend",
    imageURL: "lib/Assets/Images/storiesPlaceholder/cocktail.jpg",
  ),
  new Story(
    placeTitle: "Up-Éro",
    description: "Livemusik",
    imageURL: "lib/Assets/Images/storiesPlaceholder/band.jpg",
  )
];

List<Story> empfohlen = [
  new Story(
    placeTitle: "NEXT",
    description: "Was ist neu?",
    imageURL: "lib/Assets/Images/storiesPlaceholder/app_coding.jpg",
  ),
  new Story(
      placeTitle: "Jamy's Burger",
      description: "Gutscheincode",
      imageURL: "lib/Assets/Images/storiesPlaceholder/burger.jpg",
      played: true),
  new Story(
    placeTitle: "A5 Darmstadt",
    description: "Ü20 Party (Einlass nur gegen Ausweis!)",
    imageURL: "lib/Assets/Images/storiesPlaceholder/party.jpg",
  ),
  new Story(
    placeTitle: "Amato",
    description: "Frühlingsbuffet (20€ Pro Person)",
    imageURL: "lib/Assets/Images/storiesPlaceholder/buffet.jpg",
  ),
  new Story(
    placeTitle: "Tapp Theater",
    description: "Stand Up Comedy Night",
    imageURL: "lib/Assets/Images/storiesPlaceholder/comedy_hall.jpg",
  ),
  new Story(
    placeTitle: "Oben Drüber",
    description: "Bandabend! House, Raggea und mehr..",
    imageURL: "lib/Assets/Images/storiesPlaceholder/band.jpg",
  ),
];
