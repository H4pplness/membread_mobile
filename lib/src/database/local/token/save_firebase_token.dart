
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_firebase_token.g.dart';

@riverpod
Future<void> saveFirebaseToken(ref) async{
  final firebaseToken = ref.watch(tokenProvider).getFirebaseToken();
  if(firebaseToken==null){
    final _firebaseMessaging = FirebaseMessaging.instance;
    final newToken = await _firebaseMessaging.getToken();
    ref.read(tokenProvider).saveFirebaseToken(newToken);
    print("DA SAVE TOKEN : $newToken");
  }
}