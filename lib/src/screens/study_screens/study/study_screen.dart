import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:membreadflutter/src/screens/study_screens/study/study_page_controller.dart';
import 'package:membreadflutter/src/screens/study_screens/study/subscreens/choice_body.dart';
import 'package:membreadflutter/src/screens/study_screens/study/subscreens/detail_vocabulary_body.dart';
import '../../../widgets/atoms/sliders/study_progress_slider.dart';
import '../../../widgets/organisms/app_bars/none_title_appbar.dart';

class StudyScreen extends StatelessWidget {
  StudyScreen({super.key});
  final StudyPageController controller = Get.put(StudyPageController());

  var subScreens = [
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
    ChoiceBody(),
    DetailVocabularyBody(),
  ];

  @override
  Widget build(BuildContext context) {
    controller.progress = 0.obs;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NonTitleAppBar(onPressed:()=> Navigator.pop(context),),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              StudyProgressSlider(),
              Obx(() => subScreens[controller.progress.value])
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width-40,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () { controller.updateProgress();},
          backgroundColor: Theme.of(context).primaryColor,
          child: Text("Next",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
        ),
      ),
    );
  }
}


