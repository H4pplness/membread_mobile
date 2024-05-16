import 'package:get/get.dart';
class HomeController extends GetxController{
  var index = 0.obs;

  var currentLesson = 0.obs;

  changeIndex(i) => index.value = i;

  changeLesson(i) => currentLesson.value = i;
}