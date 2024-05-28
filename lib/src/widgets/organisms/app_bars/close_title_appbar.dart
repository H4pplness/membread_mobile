import 'package:flutter/material.dart';

class CloseTitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  Function()? onLeadingButtonPressed;
  List<Widget>? actions;
  String? title;
  CloseTitleAppbar({Key? key, this.onLeadingButtonPressed,this.actions,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: Theme.of(context).appBarTheme.elevation,
      title: Text(
          title ?? "",
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis
      ),
      leading: IconButton(
          icon: IconTheme(
              data: Theme.of(context).appBarTheme.iconTheme!,
              child: const Icon(Icons.close,size: 25)),
          onPressed: onLeadingButtonPressed),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
