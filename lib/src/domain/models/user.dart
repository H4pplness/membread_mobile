
import 'package:equatable/equatable.dart';

class User extends Equatable{
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? phone;
  String? firstname;
  String? lastname;
  int? numberOfFollowers;
  int? numberOfFollowings;

  User({this.id,this.username,this.avatar,this.email,this.phone,this.firstname,this.lastname,this.numberOfFollowers=0,this.numberOfFollowings=0});

  @override
  List<Object?> get props => [id,username];
}