import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.controller,required this.name,this.decoration,this.labelStyle});

  TextEditingController? controller;
  String name;
  InputDecoration? decoration;
  TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: labelStyle?? Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
        const SizedBox(height: 10,),
        TextField(
          controller: controller,
          style: Theme
              .of(context)
              .textTheme
              .displayMedium,
          cursorWidth: 1.5,
          decoration: decoration??InputDecoration(
            focusColor: Theme
                .of(context)
                .primaryColor,
          ),
        )
      ],
    );
  }
}
