import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/create_test_dto.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class AddMultiChoiceScreen extends ConsumerStatefulWidget {
  const AddMultiChoiceScreen({super.key});

  @override
  ConsumerState createState() => _AddMultiChoiceScreenState();
}

class _AddMultiChoiceScreenState extends ConsumerState<AddMultiChoiceScreen> {
  CreateTestDTO choiceTestDTO = CreateTestDTO();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addLesson = ref.watch(createLessonNotifierProvider);
    return Scaffold(
        appBar: CloseTitleAppbar(
          onLeadingButtonPressed: () => Navigator.pop(context),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple[400]),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        height: 200,
                        width: MediaQuery.of(context).size.width - 40,
                        child: Center(
                            child: Text(
                          choiceTestDTO.question ?? "Fill your question",
                          style: Theme.of(context).textTheme.labelSmall,
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Answers",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red[700]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          height: 120,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                choiceTestDTO.choice1 == null
                                    ? "Fill your answer"
                                    : choiceTestDTO.choice1!.question!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice1 == null ? Colors.grey : choiceTestDTO.choice1!.isCorrect! ? Colors.green : Colors.grey,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      )))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow[700]),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          height: 120,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                choiceTestDTO.choice2 == null
                                    ? "Fill your answer"
                                    : choiceTestDTO.choice2!.question!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        color: choiceTestDTO.choice2 == null ? Colors.grey : choiceTestDTO.choice2!.isCorrect! ? Colors.green : Colors.grey,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      )))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal[500]),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          height: 120,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                choiceTestDTO.choice3 == null
                                    ? "Fill your answer"
                                    : choiceTestDTO.choice3!.question!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice3 == null ? Colors.grey : choiceTestDTO.choice3!.isCorrect! ? Colors.green : Colors.grey,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      )))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container();
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink[700]),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          height: 120,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                choiceTestDTO.choice4 == null
                                    ? "Fill your answer"
                                    : choiceTestDTO.choice4!.question!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice4 == null ? Colors.grey : choiceTestDTO.choice4!.isCorrect! ? Colors.green : Colors.grey,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      )))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                    width: MediaQuery.of(context).size.width - 40,
                    onPressed: () {
                      if (choiceTestDTO.question == null ||
                          choiceTestDTO.choice1 == null ||
                          choiceTestDTO.choice2 == null ||
                          choiceTestDTO.choice3 == null ||
                          choiceTestDTO.choice4 == null) {
                        print("CHUA NHAP DU THONG TIN!");
                      } else {
                        ref
                            .watch(createLessonNotifierProvider.notifier)
                            .addLearning(choiceTestDTO);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    )),
              ),
            )
          ],
        ));
  }
}
