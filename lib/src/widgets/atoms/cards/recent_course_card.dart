
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:membreadflutter/src/domain/models/course.dart';

import '../../../screens/course_screen/course_screen.dart';

class RecentCourseCard extends StatelessWidget {
  Course course;
  RecentCourseCard({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CourseScreen(
                course: course,
              ))),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 250,
        height: 280,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
            image: course.avatar != null
                ? DecorationImage(
              image: NetworkImage(course.avatar ?? ""),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.grey[500]!,
                BlendMode.modulate,
              ),
            )
                : DecorationImage(
              image: AssetImage("assets/membread.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.grey[500]!,
                BlendMode.modulate,
              ),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Text(
                course.title ?? "",
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: Text(
                course.description ?? "",
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
