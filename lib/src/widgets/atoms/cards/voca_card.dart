import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VocaCard extends StatelessWidget {
  VocaCard({super.key, required this.voca, required this.mean, this.level = 0,this.needToReview=false});
  String voca;
  String mean;
  int level;
  bool needToReview;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailVocabularyPage(level: 4,))),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.secondary)),
              width: 30,
              height: 30,
              child: level == 0
                  ? Container()
                  : level >= 3
                      ? Icon(Icons.star,color: Colors.yellow[700],)
                      : Center(
                          child: Text(
                            '$level',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ),
            ),
            Expanded(child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      voca,
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                              ? Colors.black
                              : Colors.white),
                    ),
                    Text(
                      mean,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                              ? Colors.black
                              : Colors.white),
                    )
                  ],
                ),
              ],
            )),
            if(needToReview)Icon(Icons.flash_on,color: Colors.yellow[700],size: 30,)
          ],
        ),
      ),
    );
  }
}
