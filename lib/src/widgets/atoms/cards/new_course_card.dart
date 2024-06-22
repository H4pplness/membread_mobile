import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/widgets/atoms/images/circle_image.dart';
import 'package:membreadflutter/src/widgets/atoms/images/rectangle_image.dart';
import '../../molecules/icon_group/star_group.dart';


class CourseCard extends StatelessWidget {
  Course course;
  Function()? onTap;
  CourseCard({super.key, required this.course,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.height-40
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RectangleImage(
                width: 50,
                height: 50,
                image: course.avatar != null
                    ? DecorationImage(
                    image: NetworkImage(course.avatar ?? ""),
                    fit: BoxFit.cover)
                    : const DecorationImage(
                    image: AssetImage("assets/membread.jpg"))),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title ?? "",
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            child: Row(
                              children: [
                                const Icon(Icons.people, color: Colors.white),
                                const SizedBox(width: 3),
                                Text(
                                  course.numberOfParticipants!=null?course.numberOfParticipants.toString():"0",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.breadSlice,color: Colors.white,size: 18,),
                                const SizedBox(width: 5,),
                                Text(course.rating!=null?course.rating.toString():"0",style: Theme.of(context).textTheme.labelSmall,)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
