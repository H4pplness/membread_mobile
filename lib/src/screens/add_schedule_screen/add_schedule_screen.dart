import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

class AddScheduleScreen extends ConsumerWidget {
  const AddScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: NonTitleAppBar(
        onPressed: ()=>Navigator.pop(context),
      ),
    );
  }
}
