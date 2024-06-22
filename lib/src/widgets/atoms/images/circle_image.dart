
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  DecorationImage image;
  Color? borderColor;
  double? borderWidth;
  double? diameter;
  CircleImage({super.key,required this.image,this.borderColor,this.diameter,this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter??40,
      height: diameter??40,
      decoration: BoxDecoration(
        image: image,
        border: Border(
          bottom: BorderSide(color:borderColor??Colors.grey,width: borderWidth??1),
          top: BorderSide(color: borderColor??Colors.grey,width: borderWidth??1),
          left: BorderSide(color: borderColor??Colors.grey,width: borderWidth??1),
          right: BorderSide(color: borderColor??Colors.grey,width: borderWidth??1),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
