import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:membreadflutter/src/database/local/core/share_preferences.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/upload_avatar/upload_avatar.dart';

class ProfileAvatar extends ConsumerStatefulWidget {
  String? avatarUrl;
  bool isOwner;
  ProfileAvatar({super.key,this.avatarUrl,this.isOwner = false});

  @override
  ConsumerState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends ConsumerState<ProfileAvatar> {
  late String? _avatarUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _avatarUrl = widget.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: _avatarUrl != null
                  ? DecorationImage(
                image: NetworkImage(_avatarUrl ?? ""),
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
          child: widget.isOwner ? Container(
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
                onPressed: () async {
                  XFile? resourceImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  await ref.read(uploadAvatarProvider(resourceImage).future);
                  setState(() {
                    _avatarUrl = ref.watch(loginedUserProvider).getAvatar();
                  });
                },
              ),
            ),
          ) : Container(),
        )
      ],
    );
  }
}
