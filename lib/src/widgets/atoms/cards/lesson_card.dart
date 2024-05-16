import 'package:flutter/material.dart';
import 'package:membreadflutter/src/screens/detail_lesson_screen/detail_lesson_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/primary_card.dart';
class LessonCard extends StatelessWidget {
  int order;
  int id;
  String title;
  LessonCard({Key? key,required this.order,required this.title,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
        width: MediaQuery.of(context).size.width-40,
        onTap: (){
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => DetailLessonScreen(lessonId: id,),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: Row(
          children: [
            Text((order+1).toString(),style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(width: 20,),
            Text(title,style: Theme.of(context).textTheme.titleMedium,overflow: TextOverflow.fade,)
          ],
        )
    );
  }
}
