import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/screens/course_screen/course_screen.dart';
import 'package:membreadflutter/src/screens/schedule_screen/schedule_screen.dart';
import '../../../domain/models/notification.dart';

class NotificationCard extends StatelessWidget {
  AppNotification notification;
  NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(notification.courseId!=null){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CourseScreen(course: Course(id: notification.courseId))));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleScreen()));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: notification.avatar == null
                  ? const CircleAvatar(
                      backgroundImage: AssetImage('assets/membread.jpg'),
                      radius: 35,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(notification.avatar ?? ""),
                      radius: 35,
                    ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${notification.title} : ${notification.body}",
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${notification.createAt}",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
