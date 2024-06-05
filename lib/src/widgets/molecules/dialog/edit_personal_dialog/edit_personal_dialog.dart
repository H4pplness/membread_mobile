import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPersonalDialog extends ConsumerWidget {
  String title;
  TextEditingController? controller;
  Function()? onSave;
  EditPersonalDialog({super.key,required this.title,this.controller,this.onSave});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 25),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller,
                    maxLines: 3,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[200]!, width: 2.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  if(onSave!=null){
                    onSave!();
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 20,bottom: 20),
                  padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
