import 'package:membreadflutter/src/domain/models/learning.dart';

class Lesson<T extends Learning> {
  int? id;
  String? title;
  String? description;
  // String type = T.;

  List<T>? listLearning;

  Lesson({this.id,this.title,this.description,this.listLearning});
}