
import 'package:equatable/equatable.dart';

class User extends Equatable{
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? phone;
  
  User({this.id,this.username,this.avatar,this.email,this.phone});

  @override
  List<Object?> get props => [id,username];
}