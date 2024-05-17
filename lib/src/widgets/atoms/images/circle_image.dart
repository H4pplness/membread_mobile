
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  DecorationImage image;
  Color? borderColor;
  double? diameter;
  CircleImage({super.key,required this.image,this.borderColor,this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter??40,
      height: diameter??40,
      decoration: BoxDecoration(
        image: image,
        border: Border(
          bottom: BorderSide(color:borderColor??Colors.grey),
          top: BorderSide(color: borderColor??Colors.grey),
          left: BorderSide(color: borderColor??Colors.grey),
          right: BorderSide(color: borderColor??Colors.grey),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
