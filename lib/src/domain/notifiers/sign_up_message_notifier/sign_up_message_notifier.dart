
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_message_notifier.g.dart';
@riverpod
class SignUpMessageNotifier extends _$SignUpMessageNotifier {
  @override
  String? build(){
    return null;
  }

  void setMessage(String message){
    state = message;
  }
}