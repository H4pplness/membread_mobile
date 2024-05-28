import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

class GoalScreen extends ConsumerWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: TitleAppbar(leadingButtonOnPressed: () => Navigator.pop(context),title: Text("Goal",style: Theme.of(context).textTheme.titleMedium),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),

      ),
    );
  }
}
