
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/notification.dart';

part 'get_notification.g.dart';

@riverpod
Future<List<AppNotification>> getNotifications(ref) async{
  final dio = await ref.read(dioProviderWithAccessToken.future);
  Response response = await dio.get('notification/recent');
  if(response.statusCode == 200){
    final rawNotifications = response.data as List;
    return rawNotifications.map((rawNoti){
      final createdTime = DateTime.parse(rawNoti['createdAt']);
      final now = DateTime.now();
      final difference = now.difference(createdTime);
      final createAt = difference.inDays>0? "${difference.inDays.toString()} day ago" : "${difference.inHours.toString()} hours ago";
      return AppNotification(title: rawNoti['title'],body: rawNoti['body'],avatar: avatar(rawNoti['avatar']),createAt:createAt);
    }).toList();
  }else{
    print(response.statusMessage);
    throw Exception();
  }
}