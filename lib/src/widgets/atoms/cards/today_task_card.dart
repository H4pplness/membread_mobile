
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/models/schedule.dart';

class TodayTaskCard extends StatelessWidget {
  Schedule schedule;
  TodayTaskCard({super.key,required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  schedule.title??"",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                schedule.time??"12:00",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            schedule.body??"",
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
