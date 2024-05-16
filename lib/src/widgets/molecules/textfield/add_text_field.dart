import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/dtos/createcoursedto/createcoursedto.dart';
import '../../../domain/services/course_service/course.service.dart';
import '../../atoms/buttons/primarybutton.dart';
import '../../atoms/text_fields/custom_textfield.dart';

class AddTextField extends ConsumerWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final courseRef = ref.watch(courseService);
    return Column(
      children: [
        CustomTextField(controller: _titleController, name: "Title"),
        const SizedBox(height: 10,),
        CustomTextField(controller: _descriptionController, name: "Description"),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryButton(
            child: Text("Next",
              style: Theme.of(context).textTheme.labelMedium,),
            onPressed: () async {
              print("DA BAM VAO DAY >>>>>>>>>>>>>>>>>");
              courseRef.crearteCourse(CreateCourseDTO(title: _titleController.text,description: _descriptionController.text,author_id: 1)).then((value){
                Navigator.pop(context);
              }).onError((error, stackTrace){
                print("ERROR : " + error.toString());
              });
            },
          ),
        )
      ],
    );
  }
}


