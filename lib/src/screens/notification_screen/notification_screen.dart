import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/widgets/organisms/app_bars/title_appbar.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbar(title: Text('Notification',
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,),
        leadingButtonOnPressed:() => Navigator.pop(context),
      ),
    );
  }
}
