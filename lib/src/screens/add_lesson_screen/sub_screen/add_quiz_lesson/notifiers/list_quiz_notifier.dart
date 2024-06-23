
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/test.dart';

class ListQuizNotifier extends StateNotifier<List<Test>>{
  final Ref ref;

  ListQuizNotifier(this.ref) : super([]);

  void addQuiz(Test test){
    state = [...state,test];
  }

  void removeQuiz(Test test){
    final copyState = List<Test>.from(state);
    copyState.remove(test);
    state = copyState;
  }
}