import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  String? avatarUrl;
  ProfileAvatar({super.key,this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: avatarUrl != null
                  ? DecorationImage(
                image: NetworkImage(avatarUrl ?? ""),
                fit: BoxFit.cover,
              )
                  : const DecorationImage(
                image: AssetImage('assets/membread.jpg'),
                fit: BoxFit.cover,
              ),
              border: const Border(
                bottom: BorderSide(color: Colors.grey),
                top: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
              ),
              borderRadius: BorderRadius.circular(50)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black, width: 1)),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 17,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
