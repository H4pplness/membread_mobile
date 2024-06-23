import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  double? width;
  double? height;
  PrimaryButton({Key? key,this.onPressed,required this.child,this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
