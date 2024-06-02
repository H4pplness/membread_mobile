import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/create_lesson/create_vocabulary_lesson/create_vocabulary_lesson.dart';
import 'package:membreadflutter/src/dtos/create_lesson_dto/create_vocabulary_lesson_dto/create_vocabulary_lesson_dto.dart';
import 'package:membreadflutter/src/dtos/vocabularydto/vocabularydto.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/custom_textfield.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';
import 'notifiers/list_vocabulary_notifier.dart';

class AddVocabularyScreen extends ConsumerWidget {
  int courseId;
  AddVocabularyScreen({super.key, required this.courseId});

  _buildAddVocabularyDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController vocabularyController = TextEditingController();
    final TextEditingController meanController = TextEditingController();

    return Dialog(
        child: ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  CustomTextField(
                    controller: vocabularyController,
                    name: "Vocabulary",
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: meanController,
                    name: "Meaning",
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                width: 100,
                child: Center(
                    child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.labelMedium,
                )),
                onPressed: () {
                  ref
                      .read(listVocabularyNotifierProvider.notifier)
                      .addVocabulary(VocabularyDTO(
                          vocabulary: vocabularyController.text,
                          mean: meanController.text));
                  Navigator.of(context).pop();
                },
              )
            ],
          )),
    ));
  }

  List<Widget> _buildListVocabulary(
      BuildContext context, List<VocabularyDTO> listVocabulary, WidgetRef ref) {
    List<Widget> vocabularyComponents = [];

    for (var vocabulary in listVocabulary) {
      vocabularyComponents.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4),
                    child: Text(
                      vocabulary.vocabulary ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4),
                    child: Text(
                      vocabulary.mean ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: -10,
                right: -10,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Icon(Icons.close,color: Colors.white,size: 20,),
                  ),
                  onTap: ()=>ref.read(listVocabularyNotifierProvider.notifier).deleteVocabulary(listVocabulary.indexOf(vocabulary)),
                )
            )
          ],
        ),
      ));
    }
    return vocabularyComponents;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listVocabulary = ref.watch(listVocabularyNotifierProvider);

    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: () => Navigator.pop(context),
        actions: [
          TextButton(
              onPressed: () async {
                ref
                    .read(createLessonNotifierProvider.notifier)
                    .setListLearning(listVocabulary);

                final newLesson = ref.watch(createLessonNotifierProvider);

                CreateVocabularyLessonDTO lesson = CreateVocabularyLessonDTO(
                    title: newLesson.title ?? "",
                    courseId: courseId,
                    listVocabulary: newLesson.listVocabulary);

                await ref.read(createVocabularyLessonProvider(lesson).future);

                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: _buildListVocabulary(context, listVocabulary, ref),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildAddVocabularyDialog(context, ref);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Icon(Icons.add, size: 25)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
