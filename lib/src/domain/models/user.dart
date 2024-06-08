import 'package:equatable/equatable.dart';

import 'honor.dart';

class User extends Equatable {
  String? id;
  String? username;
  String? avatar;
  String? email;
  String? phone;
  String? firstname;
  String? lastname;
  int? numberOfFollowers;
  int? numberOfFollowings;
  int? totalScore;
  List<HONOR>? honors;
  User(
      {this.id,
      this.username,
      this.avatar,
      this.email,
      this.phone,
      this.firstname,
      this.lastname,
      this.numberOfFollowers = 0,
      this.numberOfFollowings = 0,
      this.totalScore,
      this.honors});

  @override
  List<Object?> get props => [id, username];
}
