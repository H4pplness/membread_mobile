import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'choice_notifier.g.dart';

class ChoiceState{
  int choice;
  int isChoose;

  ChoiceState({this.choice = -1, this.isChoose = -1});
}

@riverpod
class ChoiceNotifier extends _$ChoiceNotifier{
  @override
  ChoiceState build(){
    return ChoiceState();
  }

  void choose(int choice){
    state = ChoiceState(choice: choice,isChoose: state.choice+1);
  }

  void resetChoice()
  {
    state = ChoiceState();
  }
}