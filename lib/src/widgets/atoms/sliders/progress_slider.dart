import 'package:flutter/material.dart';

class ProgressSlider extends StatefulWidget {
  double progress;
  double width;
  double borderRadius;
  double height;
  Color? outLineColor;
  Color? contentColor;
  ProgressSlider({Key? key, required this.progress,required this.width,this.borderRadius = 5,this.height = 13,this.contentColor,this.outLineColor}) : super(key: key);

  @override
  State<ProgressSlider> createState() => _ProgressSliderState();
}

class _ProgressSliderState extends State<ProgressSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.outLineColor??Theme.of(context).colorScheme.secondary,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: widget.width*widget.progress ,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: widget.contentColor??Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
