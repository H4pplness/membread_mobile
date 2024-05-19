
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/speed_choice_notifier/speed_choice_notifier.dart';

class Choice {
  String choice;
  bool isTrue;
  bool isChoose;
  Choice({required this.choice, required this.isTrue, this.isChoose = false});
}

class ChooseAnswerOption extends ConsumerWidget {
  final String vocabulary;
  final List<Choice> choices;
  Function(bool isTrue)? onTap;
  ChooseAnswerOption(
      {super.key, required this.vocabulary, required this.choices, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choiceStates = ref.watch(speedChoiceNotifierProvider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              vocabulary,
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
                final choiceState = choiceStates;
                Color backgroundColor = Theme.of(context).primaryColor;
                print("Choice ${choiceState.isChoose}");
                if(choiceStates.isChoose<1){
                  if (choiceState.choice == -1) {
                    backgroundColor = Theme.of(context).primaryColor;
                  } else {
                    if (choices[index].isTrue && choiceState.choice == index) {
                      backgroundColor = Colors.green;
                    } else if (!choices[index].isTrue &&
                        choiceState.choice == index) {
                      backgroundColor = Colors.red;
                    } else {
                      backgroundColor = Theme.of(context).primaryColor;
                    }
                  }
                }
                return GestureDetector(
                  onTap: () async {
                    print("CHOOSE... ");
                    ref.read(speedChoiceNotifierProvider.notifier).choose(index);
                    await Future.delayed(const Duration(milliseconds: 500),(){
                      print("NEXT ...");
                    });
                    if (onTap != null) {
                      onTap!(choices[index].isTrue);
                    }
                    ref.read(speedChoiceNotifierProvider.notifier).resetChoice();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      choices[index].choice,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
