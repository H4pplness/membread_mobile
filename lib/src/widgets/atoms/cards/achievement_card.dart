import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/atoms/sliders/progress_slider.dart';

class AchievementCard extends StatefulWidget {
  void Function()? receive;
  AssetImage achievementImage;
  String title;
  String description;
  double progress;
  bool isReceived;
  AchievementCard(
      {super.key,
      this.receive,
      required this.achievementImage,
      required this.title,
      required this.description,
      this.progress = 0,
      this.isReceived = false});

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  late bool _isReceived;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isReceived = widget.isReceived;
  }

  @override
  Widget build(BuildContext context) {
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
                                image: widget.achievementImage,
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
                        const SizedBox(width: 20),
                        Text(widget.title,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.description,
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
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.achievementImage,
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
              maxWidth: MediaQuery.of(context).size.width - 160,
            ),
            height: 120,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                widget.progress >= 1
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () async {
                              if (!_isReceived) {
                                if (widget.receive != null) widget.receive!();
                                setState(() {
                                  _isReceived = true;
                                });
                              }
                            },
                            child: Text(
                              _isReceived ? "Received" : "Receive",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: _isReceived
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    : Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ProgressSlider(
                          progress: widget.progress >= 1 ? 1 : widget.progress,
                          height: 8,
                          width: MediaQuery.of(context).size.width - 150,
                          borderRadius: 2,
                          contentColor: Theme.of(context).primaryColor,
                        ),
                      )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
