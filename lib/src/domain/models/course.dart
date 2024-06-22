
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
  int? rating;
  int? numberOfParticipants;
  bool? canStudy;
  Course({this.id,this.title,this.description,this.lessons,this.avatar,this.author,this.rating,this.numberOfParticipants,this.canStudy = true});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title];
}