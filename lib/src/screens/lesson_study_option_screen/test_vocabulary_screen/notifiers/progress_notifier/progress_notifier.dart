import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_notifier.g.dart';

@riverpod
class ProgressNotifier extends _$ProgressNotifier{
  @override
  int build()
  {
    return 0;
  }

  void increase()=>state++;
}

