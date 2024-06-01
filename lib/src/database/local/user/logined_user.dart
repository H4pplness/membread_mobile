

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
  static const _firstnamekey = 'firstname';
  static const _lastnamekey = 'lastname';

  Future<void> setUsername(String username) async {
    await sharedPreferences.setString(_usernamekey,username);
  }

  Future<void> setId(String id) async {
    await sharedPreferences.setString(_idkey, id);
  }

  Future<void> setAvatar(String avatar) async {
    await sharedPreferences.setString(_avatarkey, avatar);
  }

  Future<void> setFirstName(String firstname) async {
    await sharedPreferences.setString(_firstnamekey, firstname);
  }

  Future<void> setLastName(String lastname) async {
    await sharedPreferences.setString(_lastnamekey, lastname);
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

  String? getFirstName(){
    final firstname = sharedPreferences.getString(_firstnamekey);
    if(firstname == ''||firstname == null)return null;
    return firstname;
  }

  String? getLastName(){
    final lastname = sharedPreferences.getString(_lastnamekey);
    if(lastname == ''||lastname == null)return null;
    return lastname;
  }

  User getUser(){
    return User(id: getId(),username: getUserName(),avatar: getAvatar());
  }
}