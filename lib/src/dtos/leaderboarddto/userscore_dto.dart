
import '../getuserinfodto/getuserinfodto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userscore_dto.g.dart';
part 'userscore_dto.freezed.dart';

@freezed
class UserScoreDTO with _$UserScoreDTO {
  const factory UserScoreDTO({
    int? score,
    GetUserInfoDTO? userInfo
  }) = _UserScoreDTO;

  factory UserScoreDTO.fromJson(Map<String,dynamic> json) => _$UserScoreDTOFromJson(json);
}