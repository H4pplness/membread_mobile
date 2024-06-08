import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/domain/repositories/notification_repository/get_notifications/get_notification.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/notification_card.dart';

class NotificationTab extends ConsumerWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(getNotificationsProvider);

    return Container(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: notifications.when(
            data: (notifications) {
              return SingleChildScrollView(
                child: Column(
                  children: notifications
                      .map((notification) =>
                          NotificationCard(notification: notification))
                      .toList(),
                ),
              );
            },
            error: (_, __) {
              print("BUG");
              return Container();
            },
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
