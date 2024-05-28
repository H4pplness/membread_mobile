import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../../domain/repositories/course_repository/get_learning_courses/get_learning_courses.dart';
import '../../../dtos/getlearningcoursedto/getlearningcoursedto.dart';
import '../../atoms/cards/course_card.dart';


class ListCourseBody extends ConsumerWidget {
  ListCourseBody({Key? key}) : super(key: key);

  _buildCourseCard(List<GetLearningCourseDTO> listCourse)
  {
    List<Widget> listCourseCard = [];
    listCourse.forEach((course) {
      listCourseCard.add(const SizedBox(height: 5));
      listCourseCard.add(CourseCard(course: course));
    });
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCourse = ref.watch(getLearningCourseProvider);
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your course",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20,),
            listCourse.when(
                data: (data) {
                  return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        return Column(
                          children: [
                            const SizedBox(height: 5,),
                            // CourseCard(course: data[index]),
                          ],
                        );
                      }
                  );
                },
                error: (error, s) {
                  printError(info: error.toString());
                  return Text(error.toString());
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                )
            )
          ],
        ),
      ),
    );
  }
}
