import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/create_course/create_course.dart';
import '../../../screens/new_home_screen/new_home_screen.dart';
import '../../atoms/buttons/primarybutton.dart';
import '../../atoms/text_fields/custom_textfield.dart';

class AddTextField extends ConsumerStatefulWidget {
  const AddTextField({super.key});

  @override
  ConsumerState createState() => _AddTextFieldState();
}

class _AddTextFieldState extends ConsumerState<AddTextField> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              ref.read(createCourseProvider(CreateCourseDTO(title: _titleController.text,description: _descriptionController.text)).future);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=>NewHomeScreen()),
                      (route) => false);
            },
          ),
        )
      ],
    );
  }
}



