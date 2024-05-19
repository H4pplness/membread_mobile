import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoDecreaseSlider extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final int timeSecond;
  final Function()? onEnd;
  final numberOfQuestion;

  AutoDecreaseSlider({
    this.width = 200,
    this.height = 5,
    this.color = Colors.blue,
    this.timeSecond = 2,
    this.onEnd,
    this.numberOfQuestion = 3,
    super.key,
  });

  @override
  _AutoDecreaseSliderState createState() => _AutoDecreaseSliderState();
}
final GlobalKey<_AutoDecreaseSliderState> autoDecreaseSliderKey = GlobalKey();

class _AutoDecreaseSliderState extends State<AutoDecreaseSlider> {
  bool resetAnimation = false;
  late int _numberOfQuestion;

  @override
  void initState() {
    super.initState();
    _numberOfQuestion = widget.numberOfQuestion - 1;
  }

  void resetSlider() {
    setState(() {
      resetAnimation = true;
      --_numberOfQuestion;
    });
    print("RESET SLIDER : $resetAnimation");
  }

  @override
  Widget build(BuildContext context) {
    if (resetAnimation) {
      print("NOT WORKING");
      setState(() {
        resetAnimation = false;
      }); // Reset the flag
      return SizedBox(
        height: widget.height,
      ); // Return an empty widget to reset the animation
    }

    print("MAKE ANIMATION");
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: widget.width, end: 0.0),
      duration: Duration(seconds: widget.timeSecond),
      builder: (context, value, child) {
        return Container(
          width: value,
          height: widget.height,
          color: widget.color,
        );
      },
      onEnd: () {
        if (widget.onEnd != null) {
          widget.onEnd!();
        }
        if(_numberOfQuestion > 0){
          resetSlider();// Reset the animation after it ends
        }
      },
    );
  }
}
