import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/choice_test_dto.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/create_test_dto.dart';

class AddMultiChoiceNotifier extends StateNotifier<CreateTestDTO> {
  final Ref ref;
  AddMultiChoiceNotifier(this.ref) : super(CreateTestDTO());

  void addQuestion(String question){
    print("QUESTION : $question");
    state = state.copyWith(question: question);
  }

  void fillChoice1(String choice) {
    if (state.choice1 == null) {
      state = state.copyWith(choice1: ChoiceTestDTO(content: choice));
    } else {
      state = state.copyWith(
          choice1: ChoiceTestDTO(
              content: choice, isCorrect: state.choice1!.isCorrect));
    }
  }

  void fillChoice2(String choice) {
    if (state.choice2 == null) {
      state = state.copyWith(choice2: ChoiceTestDTO(content: choice));
    } else {
      state = state.copyWith(
          choice2: ChoiceTestDTO(
              content: choice, isCorrect: state.choice2!.isCorrect));
    }
  }

  void fillChoice3(String choice) {
    if (state.choice3 == null) {
      state = state.copyWith(choice3: ChoiceTestDTO(content: choice));
    } else {
      state = state.copyWith(
          choice3: ChoiceTestDTO(
              content: choice, isCorrect: state.choice3!.isCorrect));
    }
  }

  void fillChoice4(String choice) {
    if (state.choice4 == null) {
      state = state.copyWith(choice4: ChoiceTestDTO(content: choice));
    } else {
      state = state.copyWith(
          choice4: ChoiceTestDTO(
              content: choice, isCorrect: state.choice4!.isCorrect));
    }
  }

  void chooseCorrectAnswer(int index) {
    print("CORRECT INDEX : $index");
    final newState = state.copyWith(
      choice1:
          state.choice1 != null ? ChoiceTestDTO(content: state.choice1!.content, isCorrect: false) : null,
      choice2:
          state.choice2 != null ? ChoiceTestDTO(content: state.choice2!.content, isCorrect: false) : null,
      choice3:
          state.choice3 != null ? ChoiceTestDTO(content: state.choice3!.content, isCorrect: false) : null,
      choice4:
          state.choice4 != null ? ChoiceTestDTO(content: state.choice4!.content, isCorrect: false) : null,
    );
    switch (index) {
      case 1:
        state = newState.copyWith(
            choice1: ChoiceTestDTO(
                content: state.choice1!.content, isCorrect: true));
      case 2:
        state = newState.copyWith(
            choice2: ChoiceTestDTO(
                content: state.choice2!.content, isCorrect: true));
      case 3:
        state = newState.copyWith(
            choice3: ChoiceTestDTO(
                content: state.choice3!.content, isCorrect: true));
      case 4:
        state = newState.copyWith(
            choice4: ChoiceTestDTO(
                content: state.choice4!.content, isCorrect: true));
    }
  }
}

final addMultiChoiceNotifierProvider =
    StateNotifierProvider<AddMultiChoiceNotifier, CreateTestDTO>(
        (ref) => AddMultiChoiceNotifier(ref));
