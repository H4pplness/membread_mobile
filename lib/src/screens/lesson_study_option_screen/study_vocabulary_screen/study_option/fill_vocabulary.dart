import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/vocabulary.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';

import '../notifiers/choice_notifier/choice_notifier.dart';

class FillVocabularyComponent extends ConsumerStatefulWidget {
  Vocabulary vocabulary;
  Function(bool)? onSubmit;
  FillVocabularyComponent({super.key, required this.vocabulary,this.onSubmit});

  @override
  ConsumerState createState() => _FillVocabularyComponentState();
}

class _FillVocabularyComponentState
    extends ConsumerState<FillVocabularyComponent> {
  late TextEditingController answerController;

  @override
  void initState() {
    super.initState();
    answerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.vocabulary.mean!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30,),
          TextField(controller: answerController,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 30,),
          Align(
            alignment: Alignment.bottomRight,
            child: PrimaryButton(
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 500),(){
                  print("NEXT ...");
                });
                if(widget.onSubmit!=null){
                  widget.onSubmit!(answerController.text == widget.vocabulary.vocabulary);
                }
                answerController.text = '';
              },
              child:
                  Text("Submit", style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,)
            ),
          )
        ],
      ),
    );
  }
}
