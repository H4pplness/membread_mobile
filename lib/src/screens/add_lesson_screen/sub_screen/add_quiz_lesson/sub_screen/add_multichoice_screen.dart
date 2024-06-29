import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/create_test_dto.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/add_quiz_lesson/notifiers/add_multichoice_notifier.dart';
import 'package:membreadflutter/src/screens/add_lesson_screen/sub_screen/notifiers/create_course_notifier/create_lesson_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';
import 'package:membreadflutter/src/widgets/atoms/text_fields/custom_textfield.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class AddMultiChoiceScreen extends ConsumerStatefulWidget {
  const AddMultiChoiceScreen({super.key});

  @override
  ConsumerState createState() => _AddMultiChoiceScreenState();
}

class _AddMultiChoiceScreenState extends ConsumerState<AddMultiChoiceScreen> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.refresh(addMultiChoiceNotifierProvider);
  }

  _buildQuestionField() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: questionController,
                  name: "Question",
                  decoration: InputDecoration(
                      // Add decoration properties if needed
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrimaryButton(
                      onPressed: (){
                        ref.watch(addMultiChoiceNotifierProvider.notifier).addQuestion(questionController.text);
                        Navigator.pop(context);
                      },
                        child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
                    PrimaryButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                        child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _buildAnswerField(int index) {
    final multiChoice = ref.watch(addMultiChoiceNotifierProvider);
    switch(index){
      case 1 :
        answerController.text = ((multiChoice.choice1 != null)?  multiChoice.choice1!.content : "")!;
      case 2 :
        answerController.text = ((multiChoice.choice2 != null)?  multiChoice.choice2!.content : "")!;
      case 3 :
        answerController.text = ((multiChoice.choice3 != null)?  multiChoice.choice3!.content : "")!;
      case 4 :
        answerController.text = ((multiChoice.choice4 != null)?  multiChoice.choice4!.content : "")!;
    }
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: answerController,
                  name: "Choice $index",
                  decoration: InputDecoration(
                    // Add decoration properties if needed
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrimaryButton(
                        onPressed: (){
                          switch(index){
                            case 1:
                              ref.watch(addMultiChoiceNotifierProvider.notifier).fillChoice1(answerController.text);
                            case 2:
                              ref.watch(addMultiChoiceNotifierProvider.notifier).fillChoice2(answerController.text);
                            case 3:
                              ref.watch(addMultiChoiceNotifierProvider.notifier).fillChoice3(answerController.text);
                            case 4:
                              ref.watch(addMultiChoiceNotifierProvider.notifier).fillChoice4(answerController.text);
                          }
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Submit",
                          style: Theme.of(context).textTheme.labelMedium,
                        )),
                    PrimaryButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.labelMedium,
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final choiceTestDTO = ref.watch(addMultiChoiceNotifierProvider);
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
                        _buildQuestionField();
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
                        _buildAnswerField(1);
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
                                    : choiceTestDTO.choice1!.content!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {
                                    if (choiceTestDTO.choice1 != null) {
                                      ref
                                          .watch(addMultiChoiceNotifierProvider
                                              .notifier)
                                          .chooseCorrectAnswer(1);
                                    }
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice1 == null
                                            ? Colors.grey
                                            : choiceTestDTO.choice1!.isCorrect
                                                ? Colors.green
                                                : Colors.grey,
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
                        _buildAnswerField(2);
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
                                    : choiceTestDTO.choice2!.content!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {
                                    if (choiceTestDTO.choice2 != null) {
                                      ref
                                          .watch(addMultiChoiceNotifierProvider
                                              .notifier)
                                          .chooseCorrectAnswer(2);
                                    }
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        color: choiceTestDTO.choice2 == null
                                            ? Colors.grey
                                            : choiceTestDTO.choice2!.isCorrect
                                                ? Colors.green
                                                : Colors.grey,
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
                        _buildAnswerField(3);
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
                                    : choiceTestDTO.choice3!.content!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {
                                    if (choiceTestDTO.choice3 != null) {
                                      ref
                                          .watch(addMultiChoiceNotifierProvider
                                              .notifier)
                                          .chooseCorrectAnswer(3);
                                    }
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice3 == null
                                            ? Colors.grey
                                            : choiceTestDTO.choice3!.isCorrect
                                                ? Colors.green
                                                : Colors.grey,
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
                        _buildAnswerField(4);
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
                                    : choiceTestDTO.choice4!.content!,
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                              GestureDetector(
                                  onTap: () {
                                    if (choiceTestDTO.choice4 != null) {
                                      ref
                                          .watch(addMultiChoiceNotifierProvider
                                              .notifier)
                                          .chooseCorrectAnswer(4);
                                    }
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        color: choiceTestDTO.choice4 == null
                                            ? Colors.grey
                                            : choiceTestDTO.choice4!.isCorrect
                                                ? Colors.green
                                                : Colors.grey,
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
