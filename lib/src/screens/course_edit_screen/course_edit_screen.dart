import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_course_info/get_course_info.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/get_teaching_courses/get_teaching_courses.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/update_course_background/update_course_background.dart';
import 'package:membreadflutter/src/domain/repositories/course_repository/update_course_info/update_course_info.dart';
import 'package:membreadflutter/src/dtos/edit_course_dto/edit_course_dto.dart';
import 'package:membreadflutter/src/screens/course_edit_screen/notifiers/course_edit_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/description_course_edit_card.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/title_course_edit_card.dart';
import 'package:membreadflutter/src/widgets/atoms/images/rectangle_image.dart';
import 'package:membreadflutter/src/widgets/molecules/dialog/edit_course_description_dialog/edit_course_description_dialog.dart';
import 'package:membreadflutter/src/widgets/molecules/dialog/edit_course_title_dialog/edit_course_title_dialog.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/none_title_appbar.dart';

class CourseEditScreen extends ConsumerStatefulWidget {
  Course course;
  CourseEditScreen({super.key, required this.course});

  @override
  ConsumerState<CourseEditScreen> createState() => _CourseEditScreenState();
}

class _CourseEditScreenState extends ConsumerState<CourseEditScreen> {
  String? _avatar;
  bool _isFirstTime = true;
  bool _isSaving = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _avatar = widget.course.avatar;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(courseEditNotifierProvider.notifier).setInitial(
              widget.course.title,
              widget.course.description,
            );
        setState(() {
          _isFirstTime = false;
        });
      });
    }
  }

  _buildTitleDialog(WidgetRef ref) {
    _titleController.text = ref.watch(courseEditNotifierProvider).title!;
    showDialog(
        context: context,
        builder: (context) {
          return EditCourseTitleDialog(controller: _titleController);
        });
  }

  _buildDescriptionDialog(WidgetRef ref) {
    _descriptionController.text =
        ref.watch(courseEditNotifierProvider).description!;
    showDialog(
        context: context,
        builder: (context) {
          return EditCourseDescriptionDialog(
              controller: _descriptionController);
        });
  }

  @override
  Widget build(BuildContext context) {
    final editCourse = ref.watch(courseEditNotifierProvider);

    return Stack(children: [
      Scaffold(
        appBar: NonTitleAppBar(
          onPressed: () => Navigator.pop(context),
          actions: [
            GestureDetector(
              onTap: () async {
                setState(() {
                  _isSaving = true;
                });
                EditCourseDTO edit = EditCourseDTO(
                    title: editCourse.title,
                    description: editCourse.description,
                    courseId: widget.course.id ?? 0);
                await ref.read(updateCourseInfoProvider(edit).future);
                await ref.refresh(getTeachingCourseProvider.future);
                setState(() {
                  _isSaving = false;
                });
              },
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  RectangleImage(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.5,
                    image: _avatar != null
                        ? DecorationImage(
                            image: NetworkImage(_avatar ?? ""),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.grey[500]!, BlendMode.modulate))
                        : DecorationImage(
                            image: const AssetImage('assets/membread.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.grey[500]!, BlendMode.modulate)),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () async {
                          XFile? resourceImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          int? courseId = widget.course.id;
                          UpdateCourseBackgroundParams data =
                              UpdateCourseBackgroundParams(
                                  resourceImage, courseId);
                          final path = await ref.read(
                              updateCourseBackgroundProvider(data).future);
                          if (path != null) {
                            setState(() {
                              _avatar = avatar(path);
                            });
                          }
                        },
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TitleCourseEditCard(
                title: editCourse.title ?? "",
                onPressed: () {
                  _buildTitleDialog(ref);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DescriptionCourseEditCard(
                description: editCourse.description ?? "",
                onPressed: () {
                  _buildDescriptionDialog(ref);
                },
              )
            ],
          ),
        ),
      ),
      if (_isSaving)
        Stack(
          children: [
            Opacity(
              opacity: 0.5, // Độ mờ khi đang loading
              child: Container(
                color: Colors.black, // Màu nền
              ),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
    ]);
  }
}
