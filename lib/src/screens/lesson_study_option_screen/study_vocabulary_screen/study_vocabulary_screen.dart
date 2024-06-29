import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/update_progress_lesson/update_progress_lesson.dart';
import 'package:membreadflutter/src/dtos/progressvocabularydto/progress_vocabulary_dto.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/notifiers/learning_notifier/learning_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/notifiers/list_vocabulary_notifier/list_vocabulary_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/notifiers/result_notifier/result_notifier.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/choose_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/fill_vocabulary.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/new_vocabulary.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/study_vocabulary_screen/study_option/result.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';
import '../../../domain/models/vocabulary.dart';
import '../../../domain/repositories/course_repository/get_lesson/get_lesson.dart';
import '../../../dtos/updateprogresslessondto/update_progress_lesson_vocabulary_dto.dart';

class StudyVocabularyScreen extends ConsumerStatefulWidget {
  int courseId;
  int lessonId;
  StudyVocabularyScreen(
      {super.key,
      required this.courseId,
      required this.lessonId});

  @override
  ConsumerState<StudyVocabularyScreen> createState() =>
      _StudyVocabularyScreenState();
}

class _StudyVocabularyScreenState extends ConsumerState<StudyVocabularyScreen> {
  Vocabulary? randomVocabulary;

  @override
  void initState() {
    super.initState();
    print("INIT STATE !>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  List<Vocabulary> getRandomElements(List<Vocabulary> list, int count) {
    if (count > list.length) {
      throw ArgumentError(
          'Count cannot be greater than the length of the list');
    }

    Random random = Random();
    List<int> indices = [];

    while (indices.length < count) {
      int index = random.nextInt(list.length);
      if (!indices.contains(index)) {
        indices.add(index);
      }
    }

    List<Vocabulary> randomElements =
        indices.map((index) => list[index]).toList();

    return randomElements;
  }

  @override
  Widget build(BuildContext context) {
    final scoreStatistics = ref.watch(resultNotifierProvider);
    final _listVocabulary = ref.watch(listVocabularyProvider);
    randomVocabulary ??= ref.watch(listVocabularyProvider.notifier).getVocabulary();
    Widget body;
    int numberOfQuestion = 15 < _listVocabulary.length * 3
        ? 15
        : _listVocabulary.length * 3;
    int correctAnswer = _listVocabulary
        .fold(0, (sum, vocabulary) => sum + vocabulary.studiedLevel);
    if (_listVocabulary.length <= 4) {
      return Scaffold(
        appBar: CloseTitleAppbar(onLeadingButtonPressed: ()=>Navigator.pop(context),),
        body: Center(
            child: Text(
              "Something wrong :v",
              style: Theme.of(context).textTheme.titleMedium,
            )),
      );
    } else {
      if (correctAnswer == numberOfQuestion) {
        body = ResultOption(
            backFunction: () async {
              final listVocabulary =  _listVocabulary.where((vocabulary) => vocabulary.studiedLevel>0).toList();
              await ref.watch(getLessonProvider.notifier).updateProgress(listVocabulary, scoreStatistics.totalScore, widget.courseId, widget.lessonId);
              ref.refresh(listVocabularyProvider);
              ref.refresh(resultNotifierProvider);
              Navigator.pop(context);
            });
      } else {
        if (randomVocabulary!.studiedLevel == 0 &&
            (randomVocabulary!.progress == 0 ||
                randomVocabulary!.needToReview)) {
          body = NewVocabularyOption(
            vocabulary: randomVocabulary!,
            onPressed: () {
              randomVocabulary!.studiedLevel++;
              randomVocabulary!.progress++;
              randomVocabulary!.needToReview = false;
              setState(() {
                randomVocabulary = ref.watch(listVocabularyProvider.notifier).getVocabulary();
              });
            },
          );
        } else if (randomVocabulary!.studiedLevel < 2) {
          final randomChoice = getRandomElements(
            _listVocabulary
                .where((vocabulary) => vocabulary != randomVocabulary)
                .toList(),
            3,
          );
          final listChoice = [
            Choice(choice: randomVocabulary!.mean ?? "", isTrue: true),
            Choice(choice: randomChoice[0].mean ?? "", isTrue: false),
            Choice(choice: randomChoice[1].mean ?? "", isTrue: false),
            Choice(choice: randomChoice[2].mean ?? "", isTrue: false),
          ]..shuffle(Random());
          body = ChooseAnswerOption(
            vocabulary: randomVocabulary!.vocabulary ?? "",
            choices: listChoice,
            onTap: (isTrue) {
              if (isTrue) {
                randomVocabulary!.studiedLevel++;
                randomVocabulary!.progress++;
                setState(() {
                  randomVocabulary = ref.watch(listVocabularyProvider.notifier).getVocabulary();
                });
                ref.read(resultNotifierProvider.notifier).correctAnswer();
              } else {
                ref.read(resultNotifierProvider.notifier).wrongAnswer();
              }
            },
          );
        } else {
          body = FillVocabularyComponent(
            vocabulary: randomVocabulary!,
            onSubmit: (correct) {
              print("DA CHAY VAO DAY !");
              if (correct) {
                randomVocabulary!.studiedLevel++;
                randomVocabulary!.progress++;
                ref.read(resultNotifierProvider.notifier).correctAnswer();
                if(correctAnswer<numberOfQuestion-1) {
                  setState(() {
                    randomVocabulary = ref.watch(listVocabularyProvider.notifier).getVocabulary();
                  });
                }
              } else {
                setState(() {
                  randomVocabulary = ref.watch(listVocabularyProvider.notifier).getVocabulary();
                });
                ref.read(resultNotifierProvider.notifier).wrongAnswer();
              }
            },
          );
        }
      }
    }


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CloseTitleAppbar(
        onLeadingButtonPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'Warning !',
                      style: GoogleFonts.montserrat(
                          fontSize: 23,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                    content: Text(
                      'If you exit, the results will not be saved.',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          ref.refresh(resultNotifierProvider);
                          ref.refresh(listVocabularyProvider);
                        },
                        child: Text('Ok',
                            style: Theme.of(context).textTheme.displayMedium),
                      ),
                    ],
                  ));
        },
        actions: [
          Text(
            scoreStatistics.totalScore.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProgressSlider(
              progress: _listVocabulary.isNotEmpty
                  ? correctAnswer / numberOfQuestion
                  : 0,
              width: MediaQuery.of(context).size.width,
              contentColor: Theme.of(context).primaryColor,
              outLineColor: Theme.of(context).colorScheme.secondary,
              borderRadius: 0,
            ),
            body
          ],
        ),
      ),
    );
  }
}
