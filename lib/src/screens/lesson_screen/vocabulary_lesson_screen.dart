import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/vocabulary_lesson.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/flip_card.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

import '../../widgets/atoms/cards/study_type_card.dart';

class VocabularyLessonScreen extends ConsumerWidget {
  VocabularyLesson lesson;
  VocabularyLessonScreen({super.key, required this.lesson});

  _buildShowVocabulary(context)
  {
    List<Widget> listVocabularyCard = [];
    lesson.listLearning?.forEach((vocabulary) {
      listVocabularyCard.add(
        SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: FlipCard(
                frontColor: Theme.of(context).primaryColor,
                backColor: Theme.of(context).primaryColor,
                height: 200,
                borderRadius: 10,
                width: MediaQuery.of(context).size.width*0.8,
                frontSide: Center(
                  child: Text(vocabulary.vocabulary??"",style: GoogleFonts.poppins(
                      fontSize : 23,
                      color : Colors.white,
                      fontWeight : FontWeight.w600
                  ),),
                ),
                backSide: Center(
                  child: Text(vocabulary.mean??"",style: GoogleFonts.poppins(
                      fontSize : 23,
                      color : Colors.white,
                      fontWeight : FontWeight.w600
                  ),),
                ),
              ),
            )
        )
      );
    });
    return listVocabularyCard;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TitleAppbar(
        leadingButtonOnPressed:()=>Navigator.pop(context),
        title: Text(lesson.title ?? "",
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: _buildShowVocabulary(context)
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StudyTypeCard(
                  icon: Icons.school,
                  title: "Study",
                  summary: "Focus on the lessons",
                  onTap: (){},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StudyTypeCard(
                  icon: Icons.task_rounded,
                  title: "Test",
                  summary: "Review what you've learned",
                  onTap: (){},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StudyTypeCard(
                  icon: Icons.speed,
                  title: "Speed review",
                  summary: "Review what you've learned ",
                  onTap: (){},
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
