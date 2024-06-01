
import 'package:equatable/equatable.dart';

class User extends Equatable{
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? phone;
  String? firstname;
  String? lastname;
  User({this.id,this.username,this.avatar,this.email,this.phone,this.firstname,this.lastname});

  @override
  List<Object?> get props => [id,username];
}