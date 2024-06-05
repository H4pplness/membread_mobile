
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionCourseEditCard extends StatelessWidget {
  String description;
  Function()? onPressed;

  DescriptionCourseEditCard({super.key,required this.description,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              if(onPressed!=null){
                onPressed!();
              }
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
