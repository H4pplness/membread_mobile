import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BorderButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  double? width;
  ButtonStyle? style;
  EdgeInsetsGeometry? padding;
  Color? color;
  BorderButton({Key? key,this.width,this.onPressed,required this.child,this.style,this.padding,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: Container(
        width: width,
        padding: padding?? const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: color?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white)
        ),
        child: child,
      ),
    );
  }
}
