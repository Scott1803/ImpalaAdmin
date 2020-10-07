import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Filter {
  int id;
  String name;
  FilterRating rating;
  FilterType type;
  IconData icon;

  Filter(
      {this.id,
      this.name,
      this.rating = FilterRating.none,
      this.type,
      this.icon});
}

final List<Filter> filters = [
  new Filter(
      id: 0,
      name: "Italienisch",
      type: FilterType.primary,
      rating: FilterRating.none,
      icon: MdiIcons.pizza),
  new Filter(
      id: 1,
      name: "Sushi",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
    id: 2,
    name: "Burger",
    type: FilterType.secondary,
    rating: FilterRating.none,
  ),
  new Filter(
      id: 3,
      name: "Pasta",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 4,
      name: "Vegan",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 5,
      name: "Döner",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 6,
      name: "Schnitzel",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 7,
      name: "Fisch",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 8,
      name: "Pizza",
      type: FilterType.primary,
      rating: FilterRating.none),
  new Filter(
      id: 9,
      name: "Vegetarisch",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 10,
      name: "Glutenfrei",
      type: FilterType.secondary,
      rating: FilterRating.none),
  new Filter(
      id: 11,
      name: "Indisch",
      type: FilterType.primary,
      rating: FilterRating.none),
  new Filter(
      id: 12,
      name: "International",
      type: FilterType.primary,
      rating: FilterRating.none),
];

enum FilterRating { none, like, love }
enum FilterType { primary, secondary }
