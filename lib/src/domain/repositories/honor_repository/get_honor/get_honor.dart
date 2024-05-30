
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/honor.dart';

part 'get_honor.g.dart';

@riverpod
Future<List<HONOR>> getHonor(ref,String userId) async {
  final dio = ref.read(dioProvider);
  Response response = await dio.get('/achievement/honor?user_id=$userId');
  if(response.statusCode == 200){
    final honors = response.data as List;
    final listHonor = honors.map((honor) => HonorExtension.fromString(honor['honor'])).toList();
    return listHonor;
  }else{
    throw Exception(response.statusMessage);
  }
}