import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/dtos/day_enum/day_enum.dart';

class RepeatScheduleGroup extends ConsumerWidget {
  List<Day> weekDay;
  Function(Day day)? onTap;

  RepeatScheduleGroup({super.key, required this.weekDay, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Repeat",
          style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700]),
        ),
        const SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Day.values
                .map((day) => GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap!(day);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: weekDay.contains(day)
                            ? Theme.of(context).primaryColor
                            : Colors.blue[200],
                        radius: 22,
                        child: Text(
                          day.value,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ))
                .toList())
      ],
    );
  }
}
