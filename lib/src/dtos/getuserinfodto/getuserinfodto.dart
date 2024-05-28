import 'package:freezed_annotation/freezed_annotation.dart';

part 'getuserinfodto.freezed.dart';
part 'getuserinfodto.g.dart';
@freezed
class GetUserInfoDTO with _$GetUserInfoDTO {
  const factory GetUserInfoDTO({
    String? id,
    String? firstName,
    String? lastName,
    String? avatar
  }) = _GetUserInfoDTO;

  factory GetUserInfoDTO.fromJson(Map<String,dynamic> json) => _$GetUserInfoDTOFromJson(json);
}