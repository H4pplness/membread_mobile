
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RectangleImage extends StatelessWidget {
  DecorationImage image;
  Color? borderColor;
  double? width;
  double? height;
  RectangleImage({super.key,required this.image,this.borderColor,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??40,
      height: height??40,
      decoration: BoxDecoration(
        image: image,
        border: Border(
          bottom: BorderSide(color:borderColor??Colors.grey),
          top: BorderSide(color: borderColor??Colors.grey),
          left: BorderSide(color: borderColor??Colors.grey),
          right: BorderSide(color: borderColor??Colors.grey),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
