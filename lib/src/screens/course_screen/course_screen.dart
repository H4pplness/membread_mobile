import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/models/course.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/lesson_card.dart';

class CourseScreen extends ConsumerWidget {
  final Course course;
  CourseScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(course.title??"",style: Theme.of(context).appBarTheme.titleTextStyle),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            floating: true,
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: course.avatar != null
                  ? Image.network(course.avatar ?? "", fit: BoxFit.cover)
                  : Image.asset(
                      "assets/membread.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index',
                        textScaler: const TextScaler.linear(5.0)),
                  ),
                );
              },
              childCount: 20,
            ),
          ),

        ],
      ),
    );
  }
}
