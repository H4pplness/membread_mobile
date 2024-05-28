import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';

class AchievementCard extends ConsumerWidget {
  void Function()? onTap;
  AssetImage achievementImage;
  String title;
  String description;
  double? progress;
  bool isReceived;
  AchievementCard(
      {super.key,
      this.onTap,
      required this.achievementImage,
      required this.title,
      required this.description,
      this.progress,
      this.isReceived = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // Hiển thị modal khi nút được nhấn
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: achievementImage,
                                fit: BoxFit.cover,
                              ),
                              border: const Border(
                                bottom: BorderSide(color: Colors.grey),
                                top: BorderSide(color: Colors.grey),
                                left: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(width: 20),
                        Text(title,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        width: MediaQuery.of(context).size.width - 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: achievementImage,
                  fit: BoxFit.cover,
                ),
                border: const Border(
                  bottom: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 140,
            ),
            height: 120,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                progress == 1
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              isReceived ? "Received" : "Receive",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: isReceived
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    : ProgressSlider(
                        progress: progress ?? 0.0,
                        height: 8,
                        width: MediaQuery.of(context).size.width - 150,
                        borderRadius: 2,
                        contentColor: Theme.of(context).primaryColor,
                      )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
