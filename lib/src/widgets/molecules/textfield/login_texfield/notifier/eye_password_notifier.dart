
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'eye_password_notifier.g.dart';

@riverpod
class EyePasswordNotifier extends _$EyePasswordNotifier{
  @override
  bool build(){
    return false;
  }

  void swapState(){
    state = !state;
  }
}