
import 'package:membreadflutter/src/domain/models/lesson.dart';
import 'package:membreadflutter/src/domain/models/test.dart';

class TestLesson extends Lesson<Test>{
  TestLesson({super.id, super.title, super.description, super.listLearning});
}