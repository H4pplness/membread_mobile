import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_recent_course/get_recent_course.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/recent_course_card.dart';
import '../../../domain/models/course.dart';
import '../../course_screen/course_screen.dart';
import '../notifier/tab_index/tab_index_notifier.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  _buildRecentCourse(BuildContext context, List<Course> courses) {
    List<Widget> courseComponents = [];
    courses.forEach((course) {
      courseComponents.add(RecentCourseCard(course: course));
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
            }),
            const SizedBox(height: 10),
            Text(
              "Today's task",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Title",
                              style: Theme.of(context).textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "17:00",
                            style: GoogleFonts.montserrat(
                                fontSize: 17,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                       const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Hôm nay sẽ học bài 1 từ 5h đến 10h đêm nhé các em , nhớ học bài đúng giờ ! ",
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
