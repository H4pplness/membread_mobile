import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleDateTextField extends ConsumerWidget {
  DateTime day;
  ScheduleDateTextField({super.key, required this.day});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700]),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
            autofocus: false,
            readOnly: true,
            style: Theme.of(context).textTheme.displayMedium,
            cursorWidth: 1.5,
            decoration: InputDecoration(
                hintText: DateFormat("dd-MM-yyyy").format(day),
                hintStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.grey[300]!,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: Colors.grey[300]!)))),
      ],
    );
  }
}
