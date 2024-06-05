import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/user.dart';
import '../core/share_preferences.dart';

part 'logined_user.g.dart';

@riverpod
LoginedUser loginedUser(LoginedUserRef ref) {
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
  static const _numberOfFollowerskey = 'numberOfFollowers';
  static const _numberOfFollowingskey = 'numberOfFollowings';
  static const int _expiryDuration = 5400;
  static const _timestampkey = 'login_timestamp';

  Future<void> _settimestamp() async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    await sharedPreferences.setInt(_timestampkey, timestamp);
  }

  Future<void> setUsername(String username) async {
    await sharedPreferences.setString(_usernamekey, username);
    await _settimestamp();
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

  Future<void> setNumberOfFollowers(int numberOfFollowers) async {
    await sharedPreferences.setInt(_numberOfFollowerskey, numberOfFollowers);
  }

  Future<void> setNumberOfFollowings(int numberOfFollowings) async {
    await sharedPreferences.setInt(_numberOfFollowingskey, numberOfFollowings);
  }

  String? getUserName() {
    final username = sharedPreferences.getString(_usernamekey);
    if (username == '' || username == null) return null;
    return username;
  }

  String? getId() {
    final id = sharedPreferences.getString(_idkey);
    if (id == '' || id == null) return null;
    return id;
  }

  String? getAvatar() {
    final avatar = sharedPreferences.getString(_avatarkey);
    if (avatar == '' || avatar == null) return null;
    return avatar;
  }

  String? getFirstName() {
    final firstname = sharedPreferences.getString(_firstnamekey);
    if (firstname == '' || firstname == null) return null;
    return firstname;
  }

  String? getLastName() {
    final lastname = sharedPreferences.getString(_lastnamekey);
    if (lastname == '' || lastname == null) return null;
    return lastname;
  }

  int? getNumberOfFollowings() {
    final numberOfFollowings = sharedPreferences.getInt(_numberOfFollowingskey);
    return numberOfFollowings;
  }

  int? getNumberOfFollowers() {
    final numberOfFollowers = sharedPreferences.getInt(_numberOfFollowerskey);
    return numberOfFollowers;
  }

  void _removeAll() async {
    await sharedPreferences.remove(_usernamekey);
    await sharedPreferences.remove(_firstnamekey);
    await sharedPreferences.remove(_lastnamekey);
    await sharedPreferences.remove(_avatarkey);
    await sharedPreferences.remove(_timestampkey);
    await sharedPreferences.remove(_numberOfFollowerskey);
    await sharedPreferences.remove(_numberOfFollowingskey);
  }


  Future<bool> checkExpiry() async{
    int? timestamp =  sharedPreferences.getInt(_timestampkey);

    if(timestamp!=null){
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      int elapsedTime = (currentTime - timestamp) ~/ 1000;

      if (elapsedTime >= _expiryDuration) {
        print("CURRENT : $currentTime");
        print("TIMESTAMP  : $timestamp");
        // Xóa dữ liệu nếu hết hạn
        _removeAll();
        // Nếu hết hạn thì trả về false
        return false;
      } else {
        // Chưa hết hạn
        return true;
      }
    }

    return false;
  }

  User getUser() {
    return User(
        id: getId(),
        username: getUserName(),
        avatar: getAvatar(),
        firstname: getFirstName(),
        lastname: getLastName(),
        numberOfFollowings: getNumberOfFollowings(),
        numberOfFollowers: getNumberOfFollowers());
  }
}
