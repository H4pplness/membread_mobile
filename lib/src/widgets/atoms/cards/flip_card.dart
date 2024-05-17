import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  double? width;
  double? height;
  double? borderRadius;
  Widget frontSide;
  Widget backSide;
  Color frontColor;
  Color backColor;

  FlipCard(
      {this.width,
      this.height,
      this.borderRadius,
      required this.frontSide,
      required this.backSide,
      this.frontColor = Colors.blue,
      this.backColor = Colors.green
      });

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  void _toggleCard() {
    setState(() {
      _isFront = !_isFront;
      if (_isFront) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double value = _controller.value;
          double frontRotation = value * 180;
          double backRotation = (value - 1) * 180;
          return IndexedStack(
            alignment: Alignment.center,
            index: _isFront ? 0 : 1,
            children: [
              _buildCardSide(
                  color: widget.frontColor,
                  child: widget.frontSide,
                  rotation: frontRotation),
              _buildCardSide(
                  color: widget.backColor,
                  child: widget.backSide,
                  rotation: backRotation),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCardSide(
      {required Color color, required Widget child, required double rotation}) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(rotation * 3.14159265359 / 180),
      alignment: Alignment.center,
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10)),
          child: child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
