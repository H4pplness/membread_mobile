
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/core/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/honor.dart';

part 'get_honor.g.dart';

@riverpod
Future<void> getHonor(ref,Honor honor) async {
  final dio = ref.read();
}