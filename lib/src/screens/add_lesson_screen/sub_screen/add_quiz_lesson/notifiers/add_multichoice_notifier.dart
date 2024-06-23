
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/dtos/lesson_type_dto/test_dto/create_test_dto.dart';

class AddMultiChoiceNotifier extends StateNotifier<CreateTestDTO>{
  final Ref ref;
  AddMultiChoiceNotifier(this.ref):super(CreateTestDTO());


}