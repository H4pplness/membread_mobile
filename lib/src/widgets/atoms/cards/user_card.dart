
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/user.dart';

class UserCard extends StatelessWidget {
  User user;
  Function()? onTap;
  UserCard({super.key,required this.user,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(color: Colors.grey[300]!))),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/membread.jpg'),
              radius: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username??"",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "${user.firstname} ${user.lastname}",
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
