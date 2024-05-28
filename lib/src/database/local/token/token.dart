import 'package:membreadflutter/src/database/local/token/auth/get_access_token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/share_preferences.dart';

part 'token.g.dart';

@riverpod
Token token(TokenRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return Token(sharedPreferences,ref);
}

class Token {
  final SharedPreferences sharedPreferences;
  final TokenRef ref;


  Token(this.sharedPreferences,this.ref);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  static const _timeStamp = 'time_stamp';
  static const int _expiryDuration = 5400;

  Future<void> saveAccessToken(String token) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setInt(_timeStamp, timestamp);
  }

  Future<void> saveRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshTokenKey, token);
  }

  Future<bool> _checkExpiry() async{
    int? timestamp = sharedPreferences.getInt(_timeStamp);

    if (timestamp != null) {
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      int elapsedTime = (currentTime - timestamp) ~/ 1000;

      if (elapsedTime >= _expiryDuration) {
        print("CURRENT : $currentTime");
        print("TIMESTAMP  : $timestamp");
        // Xóa dữ liệu nếu hết hạn
        await sharedPreferences.remove(_accessTokenKey);
        await sharedPreferences.remove(_timeStamp);

        // Nếu hết hạn thì trả về false
        return false;
      } else {
        // Chưa hết hạn
        return true;
      }
    }

    // Không có token thì trả về false
    return false;
  }

  Future<String?> getAccessToken() async {
    bool checkExpiry = await _checkExpiry();

    if(checkExpiry){
      print("CHUA HET HAN !");
      return await sharedPreferences.getString(_accessTokenKey);
    }else{
      String accessToken = await ref.read(getAccessTokenProvider.future);
      saveAccessToken(accessToken);
      return accessToken;
    }

  }

  String? getRefreshToken() {
    return sharedPreferences.getString(_refreshTokenKey);
  }
}