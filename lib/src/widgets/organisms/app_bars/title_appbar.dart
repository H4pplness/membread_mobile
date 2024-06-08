import 'package:flutter/material.dart';

class TitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  Function()? leadingButtonOnPressed;
  Widget? title;
  Color? backgroundColor;
  List<Widget>? action;
  TitleAppbar({Key? key, this.leadingButtonOnPressed,this.title,this.backgroundColor,this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      backgroundColor: backgroundColor??Theme.of(context).appBarTheme.backgroundColor,
      elevation: Theme.of(context).appBarTheme.elevation,
      leading: leadingButtonOnPressed !=null ? IconButton(
          icon: IconTheme(
              data: Theme.of(context).appBarTheme.iconTheme!,
              child: const Icon(Icons.arrow_back_ios,size: 20,)),
          onPressed: leadingButtonOnPressed) : Container(),
      title: title??Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
