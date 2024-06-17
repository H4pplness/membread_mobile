
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/database/local/token/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network.dart';
import '../../../../dtos/create_schedule_body/create_schedule_body.dart';

part 'create_schedule.g.dart';



@riverpod
Future<void> createSchedule(CreateScheduleRef ref,CreateScheduleBody body) async {
  final dio = await ref.read(dioProviderWithAccessToken.future);
  final firebaseToken = ref.read(tokenProvider).getFirebaseToken();
  print("TOKEN : $firebaseToken");
  print("DATA : ${{...body.toJson(),'token' : firebaseToken}}");
  Response response = await dio.post('/notification/schedule',data : {...body.toJson(),'token' : firebaseToken});

}