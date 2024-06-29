import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/course_repository/get_lesson/get_lesson.dart';
import '../../dtos/lesson_type_dto/vocabularydto/vocabularydto.dart';
import '../../widgets/atoms/cards/voca_card.dart';
import '../../widgets/atoms/sliders/progress_slider.dart';
import '../../widgets/organisms/app_bars/close_title_appbar.dart';

class DetailLessonScreen extends ConsumerWidget {
  int lessonId;
  DetailLessonScreen({this.lessonId=1});

  _buildVocabularyCards(List<VocabularyDTO> listVocabulary)
  {
    List<Widget> listCard = [];
    listVocabulary.forEach((vocabulary) {
      listCard.add(VocaCard(voca: vocabulary.vocabulary??"", mean: vocabulary.mean??"",level: vocabulary.progress??0));
      listCard.add(const SizedBox(height: 5));
    });

    return Column(
      children: listCard,
    );
  }

  @override
  Widget build(BuildContext context,ref) {
    final data = ref.watch(getLessonProvider.notifier).fetchLesson(lessonId);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CloseTitleAppbar(
          onLeadingButtonPressed: () => Navigator.pop(context),
          title: data.when(data: (data)=>data.title, error: (err,s)=> "" , loading: ()=>""),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          color: Theme.of(context).primaryColor,
                          width: 60,
                          height: 70,
                          child: Center(
                              child: Text(
                                "1",
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  // Text(
                                  //   _data.when(data: (data)=>data.title, error: (err,s){
                                  //     print(err.toString());
                                  //     return "Error";
                                  //   }, loading: ()=>"Loading"),
                                  //   style:
                                  //   Theme.of(context).textTheme.titleMedium,
                                  // ),
                                  Text(
                                    "1/100",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ),
                            ProgressSlider(
                              progress: 0.1,
                              width: MediaQuery.of(context).size.width - 60,
                              borderRadius: 0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // _data.when(
                  //     data:(data)=>_buildVocabularyCards(data.listVocabulary??[]),
                  //     error: (err,s)=>Text(err.toString()),
                  //     loading: ()=>const Center(child: CircularProgressIndicator(),)
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Theme.of(context).cardColor;
                            }
                            return Theme.of(context).primaryColor;
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Điều chỉnh giá trị này để thay đổi border radius
                          ),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Center(
                          child: Text(
                            "Continue",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(30, 50)),
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                // Trạng thái khi nút được nhấn
                                return Theme.of(context).cardColor;
                              }
                              // Trạng thái mặc định
                              return Theme.of(context).primaryColor;
                            },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Điều chỉnh giá trị này để thay đổi border radius
                            ),
                          ),
                        ),
                        child: Container(
                          height: 50,
                          child: const Center(
                              child: Icon(
                                Icons.menu_outlined,
                                size: 25,
                                color: Colors.white,
                              )),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
