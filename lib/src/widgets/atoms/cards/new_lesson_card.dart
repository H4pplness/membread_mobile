import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonCard extends StatelessWidget {
  String title;
  String description;
  Function()? onTap;
  LessonCard({super.key,required this.title,required this.description,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100]),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          // height: 100.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize : 17,
                        fontWeight : FontWeight.w500,
                        color : Colors.black
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                        fontSize : 14,
                        fontWeight : FontWeight.w500,
                        color : Colors.black
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              )
            ],
          )),
    );
  }
}
