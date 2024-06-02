import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_recent_course/get_recent_course.dart';
import '../../../domain/models/course.dart';
import '../../course_screen/course_screen.dart';
import '../notifier/tab_index/tab_index_notifier.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  _buildRecentCourse(BuildContext context, List<Course> courses) {
    List<Widget> courseComponents = [];
    courses.forEach((course) {
      courseComponents.add(
        GestureDetector(
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
        ),
      );
    });
    return courseComponents;
  }

  @override
  Widget build(BuildContext context, ref) {
    final recentCourse = ref.watch(getRecentCourseProvider);
    return Container(
      padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent course",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: () =>
                      ref.read(tabIndexNotifierProvider.notifier).setIndex(1),
                  child: Text("More",
                      style: GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
            const SizedBox(height: 10),
            recentCourse.when(data: (recentCourses) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildRecentCourse(context, recentCourses),
                ),
              );
            }, error: (_, __) {
              return Container();
            }, loading: () {
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
