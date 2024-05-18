import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_choice_notifier.g.dart';

class ChoiceState{
  int choice;
  int isChoose;

  ChoiceState({this.choice = -1, this.isChoose = -1});
}

@riverpod
class TestChoiceNotifier extends _$TestChoiceNotifier{
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