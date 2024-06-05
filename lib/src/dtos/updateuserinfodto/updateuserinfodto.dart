
import 'package:freezed_annotation/freezed_annotation.dart';

part 'updateuserinfodto.g.dart';
part 'updateuserinfodto.freezed.dart';

@freezed
class UpdateUserInfoDTO with _$UpdateUserInfoDTO {
  const factory UpdateUserInfoDTO({
    String? userName,
    String? firstName,
    String? lastName
  }) = _UpdateUserInfoDTO;

  factory UpdateUserInfoDTO.fromJson(Map<String,dynamic> json) => _$UpdateUserInfoDTOFromJson(json);

}