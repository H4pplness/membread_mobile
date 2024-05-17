
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_tab_notifier.g.dart';

@riverpod
class CourseTabNotifier extends _$CourseTabNotifier {
  @override
  int build() => 0;

  void setIndex(index){
    state = index;
  }
}