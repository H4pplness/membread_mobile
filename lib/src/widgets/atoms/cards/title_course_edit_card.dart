import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleCourseEditCard extends ConsumerWidget {
  String title;
  Function()? onPressed;
  TitleCourseEditCard({super.key,required this.title,this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Title",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          IconButton(
              onPressed: (){
                if(onPressed!=null){
                  onPressed!();
                }
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ))
        ],
      ),
    );
  }
}
