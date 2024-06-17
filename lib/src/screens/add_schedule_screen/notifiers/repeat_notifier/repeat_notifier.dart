
import 'package:membreadflutter/src/dtos/day_enum/day_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeat_notifier.g.dart';



@riverpod
class RepeatNotifier extends _$RepeatNotifier {

  @override
  List<Day> build(){
    return [];
  }

  void addDay(Day day){
    if(!state.contains(day)) {
      state = [...state,day];
    } else{
      state = state.where((d) => d != day).toList();
    }
  }

}