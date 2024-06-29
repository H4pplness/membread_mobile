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
  late int _numberOfQuestion;
  int _keyIndex = 0;

  @override
  void initState() {
    super.initState();
    _numberOfQuestion = widget.numberOfQuestion - 1;
  }

  void resetSlider() {
    print("RESET");
    setState(() {
      --_numberOfQuestion;
      _keyIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("MAKE ANIMATION");
    return TweenAnimationBuilder<double>(
      key: ValueKey<int>(_keyIndex),
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
          resetSlider();
        }
      },
    );
  }
}
