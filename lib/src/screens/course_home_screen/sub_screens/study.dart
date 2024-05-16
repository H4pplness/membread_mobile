import 'package:flutter/material.dart';

import '../../../dtos/lessoninfodto/lessoninfodto.dart';
import '../../../widgets/atoms/cards/lesson_card.dart';

class Study extends StatelessWidget {
  List<LessonInfoDTO>? listLesson;
  Study({super.key,this.listLesson});

  _buildListLesson()
  {
    List<Widget> listWidget = [];
    listLesson?.asMap().forEach((index, lesson) {
      listWidget.add(LessonCard(order: index, title: lesson.title ?? '',id: lesson.id??0,));
      listWidget.add(const SizedBox(height: 5));
    });

    return listWidget;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: _buildListLesson()
        ),
      ),
    );
  }
}
