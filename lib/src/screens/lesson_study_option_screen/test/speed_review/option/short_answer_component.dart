import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/short_answer.dart';
import 'package:membreadflutter/src/screens/lesson_study_option_screen/test/speed_review/notifier/speed_test_short_answer_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';

class ShortAnswerComponent extends ConsumerStatefulWidget {
  final ShortAnswer question;
  final Function()? onTap;
  const ShortAnswerComponent({super.key, required this.question,this.onTap});

  @override
  ConsumerState<ShortAnswerComponent> createState() =>
      _ShortAnswerComponentState();
}

class _ShortAnswerComponentState extends ConsumerState<ShortAnswerComponent> {
  late TextEditingController answerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    answerController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    answerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shortAnswer = ref.watch(speedTestShortAnswerNotifierProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Text(
            widget.question.question!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextField(
            controller: answerController,
          ),
          PrimaryButton(
              child: Text(
            "Submit",
            style: Theme.of(context).textTheme.labelMedium,
          ),
            onPressed: (){
                if(answerController.text == widget.question.shortAnswer){
                  ref.read(speedTestShortAnswerNotifierProvider.notifier).completeAnswer(true);
                }else{
                  ref.read(speedTestShortAnswerNotifierProvider.notifier).completeAnswer(false);
                }
                Future.delayed(Duration(milliseconds: 1000));
                if(widget.onTap!=null){
                  widget.onTap!();
                }
            },
          ),
        ],
      ),
    );
  }
}
