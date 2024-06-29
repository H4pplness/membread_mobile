import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function()? onTap;
  const SaveButton({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Row(
          children: [
            Text("Save",style: Theme.of(context).textTheme.labelMedium,),
            SizedBox(width: 3,),
            Icon(Icons.save,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
