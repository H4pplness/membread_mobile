
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';

import '../notifier/tab_index_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      padding: const EdgeInsets.only(top: 70,left: 20,right: 20,bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent course" ,style: Theme.of(context).textTheme.titleMedium,),
                GestureDetector(
                  onTap: () =>
                      ref.read(tabIndexNotifierProvider.notifier).setIndex(1),
                  child: Text("More" ,
                    style: GoogleFonts.notoSans(
                    fontSize : 15,
                    color : Theme.of(context).primaryColor,
                    fontWeight : FontWeight.w700
                  )),
                )
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width : 200,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Course 1",style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(height: 5),
                        Text("Hello world ae nhe bla bla bla",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        ProgressSlider(progress: 0.5, width: 160,outLineColor: Colors.black12,)
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
