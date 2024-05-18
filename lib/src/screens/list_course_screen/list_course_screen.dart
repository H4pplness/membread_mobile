import 'package:flutter/material.dart';

import '../../widgets/organisms/app_bars/close_title_appbar.dart';
import '../../widgets/organisms/bodys/list_course_body.dart';
import '../add_course_screen/add_course_screen.dart';

class ListCourseScreen extends StatelessWidget {
  String course_title;
  ListCourseScreen({Key? key,required this.course_title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CloseTitleAppbar(
        title: course_title,
        onLeadingButtonPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCourseScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListCourseBody(),
    );
  }
}
