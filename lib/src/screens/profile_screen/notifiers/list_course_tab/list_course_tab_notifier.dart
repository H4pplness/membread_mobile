
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_course_tab_notifier.g.dart';

@riverpod
class ListCourseTabNotifier extends _$ListCourseTabNotifier {
  @override
  int build() => 0;

  void setIndex(int index){
    state = index;
  }
}