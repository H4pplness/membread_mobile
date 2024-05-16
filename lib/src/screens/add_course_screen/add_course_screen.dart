import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/molecules/textfield/add_text_field.dart';
import '../../widgets/organisms/app_bars/title_appbar.dart';

class AddCourseScreen extends ConsumerWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: TitleAppbar(title: Text("Create new course",style: Theme.of(context).textTheme.titleMedium,),leadingButtonOnPressed: ()=>Navigator.pop(context),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              AddTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
