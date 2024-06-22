import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_learning_courses/get_learning_courses.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/join_course/join_course.dart';

import '../../../screens/profile_screen/profile_screen.dart';
import '../../molecules/icon_group/star_group.dart';

class SummaryCourseAppbar extends ConsumerStatefulWidget {
  Course course;
  SummaryCourseAppbar({super.key, required this.course});

  @override
  ConsumerState createState() => _SummaryCourseAppbarState();
}

class _SummaryCourseAppbarState extends ConsumerState<SummaryCourseAppbar> {
  late Course _course;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _course = widget.course;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileScreen(user: _course.author))),
                child: Row(
                  children: [
                    _course.author?.avatar != null
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(_course.author?.avatar ?? ""))
                        : const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/membread.jpg")),
                    const SizedBox(width: 10),
                    Text(_course.author?.username ?? "",
                        style: Theme.of(context).textTheme.titleSmall)
                  ],
                ),
              ),
              TextButton(
                  onPressed: () async {
                    await ref.read(joinCourseProvider(_course.id ?? 0));
                    setState(() {
                      _course.canStudy = !_course.canStudy!;
                    });
                    ref.refresh(getLearningCourseProvider);
                  },
                  style: ButtonStyle(
                      backgroundColor: _course.canStudy!
                          ? const MaterialStatePropertyAll<Color>(Colors.grey)
                          : const MaterialStatePropertyAll<Color>(Colors.blue)),
                  child: Text(
                    _course.canStudy! ? "Subcribed" : "Subcribe",
                    style: Theme.of(context).textTheme.labelSmall,
                  ))
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: FaIcon(FontAwesomeIcons.breadSlice,
                      size: 30, color: Colors.grey[400]),
                ),
                const SizedBox(width: 15),
                Text(_course.rating != null ? _course.rating.toString() : "0",
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface))
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(_course.description ?? "",
              style: Theme.of(context).textTheme.displayMedium)
        ],
      ),
    );
  }
}
