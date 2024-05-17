
import 'package:equatable/equatable.dart';
import 'package:membreadflutter/src/domain/models/user.dart';

import 'lesson.dart';

class Course extends Equatable{
  int? id;
  String? title;
  String? description;
  List<Lesson>? lessons;
  User? author;
  String? avatar;
  double? rating;
  int? numberOfParticipants;
  Course({this.id,this.title,this.description,this.lessons,this.avatar,this.author,this.rating,this.numberOfParticipants});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title];
}