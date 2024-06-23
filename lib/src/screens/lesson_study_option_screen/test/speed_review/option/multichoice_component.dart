import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/speed_test_result_notifier.dart';

import '../../../../../domain/models/multichoice.dart';

class MultichoiceComponent extends ConsumerWidget {
  MultiChoice question;
  Function(bool isTrue)? onTap;
  MultichoiceComponent({super.key, required this.question,this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(speedTestResultNotifierProvider);
    List<dynamic> choices = [
      {'choice': question.choice1!, 'result': question.correctAnswer == 1},
      {'choice': question.choice2!, 'result': question.correctAnswer == 2},
      {'choice': question.choice3!, 'result': question.correctAnswer == 3},
      {'choice': question.choice4!, 'result': question.correctAnswer == 4}
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(children: [
        Text(
          question.question!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.4,
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: choices.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  print("REMOVE ...");
                  ref
                      .read(speedTestResultNotifierProvider.notifier)
                      .chooceAnswer(index + 1, choices[index]['result']);
                  await Future.delayed(Duration(milliseconds: 1000));
                  if (onTap != null) {
                    await onTap!(choices[index]['result']);
                  }

                  ref.read(speedTestResultNotifierProvider.notifier)
                    .resetState();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: result.isTrue == null
                        ? Theme.of(context).primaryColor
                        : result.choice == (index + 1)
                            ? (result.isTrue == true
                                ? Colors.green
                                : Colors.red)
                            : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    choices[index]['choice'],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
