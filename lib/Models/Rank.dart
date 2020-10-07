class Rank {
  final int id;
  final int requiredCredits;
  final String name;

  Rank({this.id, this.requiredCredits, this.name});
}

final List<Rank> ranks = [
  new Rank(
    id: 0,
    requiredCredits: 500,
    name: "Tellerwäscher",
  ),
  new Rank(
    id: 1,
    requiredCredits: 650,
    name: "Kellner",
  ),
  new Rank(
    id: 2,
    requiredCredits: 1000,
    name: "Koch",
  ),
  new Rank(
    id: 3,
    requiredCredits: 1400,
    name: "Chefkoch",
  ),
  new Rank(
    id: 4,
    requiredCredits: 2000,
    name: "Feinschmecker",
  ),
];

final Rank activeRank = ranks[3];
