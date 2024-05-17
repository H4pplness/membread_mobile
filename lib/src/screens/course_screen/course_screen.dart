import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/models/learning.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/new_lesson_card.dart';

import '../../domain/models/lesson.dart';
import '../lesson_screen/vocabulary_lesson_screen.dart';

class CourseScreen extends ConsumerWidget {
  final Course course;
  CourseScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            pinned: true,
            floating: true,
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: course.avatar != null
                  ? Image.network(course.avatar ?? "", fit: BoxFit.cover)
                  : Image.asset(
                      "assets/membread.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        course.author?.avatar != null
                            ? CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    NetworkImage(course.author?.avatar ?? ""))
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
                              color: Theme.of(context).colorScheme.onSurface))
                    ],
                  ),
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
                print("LESSON : ${lesson.runtimeType}");
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
                            title: Text('Unknown Lesson Type',style: Theme.of(context).appBarTheme.titleTextStyle)
                          ),
                          body: Center(
                            child: Text('This lesson type is not supported.',style: Theme.of(context).textTheme.titleMedium)
                          ),
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
  }
}
