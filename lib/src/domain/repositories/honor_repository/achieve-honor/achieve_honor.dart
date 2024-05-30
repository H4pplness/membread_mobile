
import 'package:dio/dio.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/honor.dart';

part 'achieve_honor.g.dart';

@riverpod
Future<dynamic> achieveHonor (ref,HONOR honor) async {
  final dio =await ref.read(dioProviderWithAccessToken.future);
  Response response = dio.post('/achievement',data : {
    "honor" : honor.value
  });

  if(response.statusCode == 201){
    return {"message" : "Achieved ${honor.toString()}" , "statusCode" : 201};
  }else{
    return {"message" : "Error : ${response.statusMessage}", "statusCode" : response.statusCode};
  }

}