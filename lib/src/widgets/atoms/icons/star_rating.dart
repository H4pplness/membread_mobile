
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  double? value;
  double? size;
  StarRating({super.key,this.value = 1,this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.star,
          color: Colors.grey,
          size: size??25,
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: Icon(
              Icons.star,
              color: Colors.amberAccent,
              size: size??25,
            ),
          ),
        ),
      ],
    );
  }
}
