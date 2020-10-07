import 'package:flutter/material.dart';

class Starrating extends StatelessWidget {
  final double iconSize;
  final int rating;
  Starrating({this.rating, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(
          rating < 1 ? Icons.star_border : Icons.star,
          color: Colors.red,
          size: iconSize,
        ),
        new Icon(
          rating < 2 ? Icons.star_border : Icons.star,
          color: Colors.red,
          size: iconSize,
        ),
        new Icon(
          rating < 3 ? Icons.star_border : Icons.star,
          color: Colors.red,
          size: iconSize,
        ),
        new Icon(
          rating < 4 ? Icons.star_border : Icons.star,
          color: Colors.red,
          size: iconSize,
        ),
        new Icon(
          rating < 5 ? Icons.star_border : Icons.star,
          color: Colors.red,
          size: iconSize,
        ),
      ],
    );
  }
}
