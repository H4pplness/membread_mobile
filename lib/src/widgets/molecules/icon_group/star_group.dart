import 'package:flutter/cupertino.dart';

import '../../atoms/icons/star_rating.dart';


class StarGroup extends StatelessWidget {
  double rating;
  StarGroup({super.key, this.rating = 0});

  @override
  Widget build(BuildContext context) {
    List<Widget> starGroup = [];
    int integerPart = rating.truncate();

    for (int i = 0; i < integerPart; i++) {
      starGroup.add(StarRating(value: 1));
    }

    if (integerPart != 5) {
      starGroup.add(StarRating(value: rating - integerPart));
      int unVoteInteger = 5 - integerPart;
      for (int i = 0; i < unVoteInteger - 1; i++) {
        starGroup.add(StarRating(
          value: 0,
        ));
      }
    }

    return Row(
      children: starGroup
    );
  }
}
