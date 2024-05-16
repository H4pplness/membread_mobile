
import 'package:equatable/equatable.dart';

import 'lesson.dart';

class Course extends Equatable{
  int? id;
  String? title;
  String? description;
  List<Lesson>? lessons;

  Course({this.id,this.title,this.description,this.lessons});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title];
}