import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/models/learning.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/domain/notifiers/user_notifier/user_notifier.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_course_info/get_course_info.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/add_leson_screen.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/screens/profile_screen/profile_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/new_lesson_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

import '../../domain/models/lesson.dart';
import '../../widgets/molecules/icon_group/star_group.dart';
import '../lesson_screen/vocabulary_lesson_screen.dart';

class CourseScreen extends ConsumerWidget {
  final Course course;
  CourseScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseParams = GetCourseInfoParams(
        course.id ?? 0);
    final courseDetailFuture =
        ref.read(getCourseInfoProvider(courseParams).future);
    final user = ref.watch(loginedUserProvider);

    return FutureBuilder<Course>(
      future: courseDetailFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              appBar: NonTitleAppBar(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context)=>NewHomeScreen()),
                    (route) => false)
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ));
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: NonTitleAppBar(onPressed: () => Navigator.pop(context)),
            body: Center(
              child: Text("Some thing wrong :v"),
            ),
          );
        } else if (snapshot.hasData) {
          final course = snapshot.data!;
          bool isAuthor = (course.author?.id == user.getId());
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(course.title ?? "",
                      style: Theme.of(context).appBarTheme.titleTextStyle),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    isAuthor ? IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddLessonScreen(courseId: course.id??0,))),
                        icon: Icon(
                          Icons.add,
                          weight: 50,
                          size: 25,
                        )) : Container()
                  ],
                  pinned: true,
                  floating: true,
                  stretchTriggerOffset: 300.0,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: course.avatar != null
                        ? Image.network(course.avatar ?? "", fit: BoxFit.cover)
                        : Image.asset("assets/membread.jpg", fit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
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
                                style: GoogleFonts.notoSans(
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
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Lesson<Learning>? lesson = course.lessons?[index];
                      return LessonCard(
                        title: course.lessons?[index].title ?? "",
                        description: course.lessons?[index].description ?? "",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          switch (course.lessons![index].runtimeType) {
                            case VocabularyLesson:
                              return VocabularyLessonScreen(
                                  lesson: lesson as VocabularyLesson);
                            default:
                              return Scaffold(
                                appBar: AppBar(
                                    title: Text('Unknown Lesson Type',
                                        style: Theme.of(context)
                                            .appBarTheme
                                            .titleTextStyle)),
                                body: Center(
                                    child: Text(
                                        'This lesson type is not supported.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)),
                              );
                          }
                        })),
                      );
                    },
                    childCount: course.lessons?.length ?? 0,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            child: Center(
              child: Text("No data available"),
            ),
          );
        }
      },
    );
  }
}
