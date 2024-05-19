
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealGroup extends StatelessWidget {
  int healNumber;
  HealGroup({super.key,this.healNumber = 3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite,color:healNumber >= 1? Colors.red : Colors.grey,size: 35),
        Icon(Icons.favorite,color:healNumber >= 2? Colors.red : Colors.grey,size: 35),
        Icon(Icons.favorite,color:healNumber >= 3? Colors.red : Colors.grey,size: 35),
      ],
    );
  }
}
