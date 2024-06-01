import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';

import '../../../screens/profile_screen/profile_screen.dart';
import '../../molecules/icon_group/star_group.dart';

class SummaryCourseAppbar extends ConsumerWidget {
  Course course;
  SummaryCourseAppbar({super.key,required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(user: course.author))),
            child: Row(
              children: [
                course.author?.avatar != null
                    ? CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        course.author?.avatar ?? ""))
                    : const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    AssetImage("assets/membread.jpg")),
                const SizedBox(width: 10),
                Text(course.author?.username ?? "",
                    style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
          ),
          const SizedBox(height: 5),
          StarGroup(rating: 4.5),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: 25,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 5),
              Text(
                  course.numberOfParticipants != null
                      ? course.numberOfParticipants.toString()
                      : "0",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface))
            ],
          ),
          SizedBox(height: 5),
          Text(course.description ?? "",
              style: Theme.of(context).textTheme.displaySmall)
        ],
      ),
    );
  }
}
