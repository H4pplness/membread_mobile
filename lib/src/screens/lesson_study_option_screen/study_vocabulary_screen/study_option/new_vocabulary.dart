
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/primarybutton.dart';

import '../../../../domain/models/vocabulary.dart';

class NewVocabularyOption extends ConsumerWidget {
  Vocabulary vocabulary;
  Function()? onPressed;
  NewVocabularyOption({super.key,required this.vocabulary,this.onPressed});

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(vocabulary.vocabulary??"",style: Theme.of(context).textTheme.titleLarge,),
                Text(vocabulary.mean??"",style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
          PrimaryButton(
              onPressed: onPressed,
              width: MediaQuery.of(context).size.width-40,
              child: Center(
                child: Text("Next",style: GoogleFonts.poppins(
                  fontSize : 18,
                  fontWeight : FontWeight.w600,
                  color : Colors.white
                )),
              )
          )
        ],
      ),
    );
  }
}
