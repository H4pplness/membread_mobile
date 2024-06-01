import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/primary_card.dart';

class StudyTypeCard extends StatelessWidget {
  IconData icon;
  String title;
  String summary;
  void Function()? onTap;
  StudyTypeCard({Key? key,required this.icon,required this.title,required this.summary,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: GoogleFonts.montserrat(
                fontSize : 18,
                fontWeight : FontWeight.w600,
                color : Colors.white
              ),),
              const SizedBox(height: 5,),
              Text(summary,style: GoogleFonts.montserrat(
                  fontSize : 13,
                  fontWeight : FontWeight.w500,
                  color : Colors.white
              ),)
            ],
          )
        ],
      )
    );
  }
}
