
import 'package:equatable/equatable.dart';

class AppNotification{
  int? id;
  String? title;
  String? body;
  String? avatar;
  String? createAt;
  int? courseId;

  AppNotification({this.id,this.title,this.body,this.avatar,this.createAt,this.courseId});
}