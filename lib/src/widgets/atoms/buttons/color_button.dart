import 'package:flutter/material.dart';
class ColorButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  double? width;
  Color? color;
  ColorButton({Key? key,this.onPressed,required this.child,this.width,this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(
          color: color??Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
