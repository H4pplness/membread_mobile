import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/widgets/atoms/images/circle_image.dart';


import '../../molecules/icon_group/star_group.dart';
import '../icons/star_rating.dart';


class CourseCard extends StatelessWidget {
  Course course;
  Function()? onTap;
  CourseCard({super.key, required this.course,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleImage(
                diameter: 50,
                image: course.avatar != null
                    ? DecorationImage(
                    image: NetworkImage(course.avatar ?? ""),
                    fit: BoxFit.cover)
                    : const DecorationImage(
                    image: AssetImage("assets/membread.jpg"))),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.white54),
                        const SizedBox(width: 3),
                        Text(
                          course.author?.username ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    StarGroup(rating: 4.5)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
