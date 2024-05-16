import 'package:flutter/material.dart';
class LightButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  double? width;
  LightButton({Key? key,this.onPressed,required this.child,this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
