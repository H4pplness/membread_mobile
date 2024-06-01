
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOnlyButton extends StatelessWidget {
  Color color;
  bool hasUnderline;
  Function()? onPressed;
  String label;
  TextOnlyButton({super.key,this.color = Colors.black,this.hasUnderline = false,this.onPressed,required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
        child: Container(
          decoration: hasUnderline ? BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: color)
              )
          ) : null,
          child: Text(label,style: GoogleFonts.montserrat(
              fontSize : 20,
              color : color,
              fontWeight : FontWeight.w600
          )),
        )
    );
  }
}
