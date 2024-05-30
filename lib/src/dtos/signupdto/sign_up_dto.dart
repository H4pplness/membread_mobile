import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_dto.g.dart';
part 'sign_up_dto.freezed.dart';

@freezed
class SignUpDTO with _$SignUpDTO{
  const factory SignUpDTO({
    required String email,
    required String password,
    required String username,
    String? firstName,
    String? lastName,
  }) = _SignUpInfo;

  factory SignUpDTO.fromJson(Map<String,dynamic> json) => _$SignUpDTOFromJson(json);
}