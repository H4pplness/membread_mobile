
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  String title;
  String content;
  Function()? onPressed;
  UserInfoCard({super.key,required this.title,required this.content,this.onPressed});

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
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    content,
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
