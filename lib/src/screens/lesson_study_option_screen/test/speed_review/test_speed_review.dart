import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/close_title_appbar.dart';

class TestSpeedReview extends ConsumerWidget {
  const TestSpeedReview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CloseTitleAppbar(onLeadingButtonPressed:()=> Navigator.pop(context),),
      body: Container(),
    );
  }
}
