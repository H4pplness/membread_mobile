

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/user.dart';
import '../core/share_preferences.dart';

part 'logined_user.g.dart';

@riverpod
LoginedUser loginedUser(LoginedUserRef ref){
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LoginedUser(sharedPreferences);
}

class LoginedUser {
  final SharedPreferences sharedPreferences;

  LoginedUser(this.sharedPreferences);

  static const _usernamekey = 'loginedUsername';
  static const _idkey = 'loginedId';
  static const _avatarkey = 'loginedAvatar';

  Future<void> setUsername(String username) async {
    await sharedPreferences.setString(_usernamekey,username);
  }

  Future<void> setId(String id) async {
    await sharedPreferences.setString(_idkey, id);
  }

  Future<void> setAvatar(String avatar) async {
    await sharedPreferences.setString(_avatarkey, avatar);
  }

  String? getUserName(){
    final username =  sharedPreferences.getString(_usernamekey);
    if(username == '' || username == null)return null;
    return username;
  }

  String? getId(){
    final id = sharedPreferences.getString(_idkey);
    if(id == '' || id == null)return null;
    return id;
  }

  String? getAvatar(){
    final avatar =  sharedPreferences.getString(_avatarkey);
    if(avatar == '' || avatar == null)return null;
    return avatar;
  }

  User getUser(){
    return User(id: getId(),username: getUserName(),avatar: getAvatar());
  }
}