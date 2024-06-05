
import 'package:membreadflutter/src/dtos/updateuserinfodto/updateuserinfodto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_edit_notifier.g.dart';

@riverpod
class PersonalEditNotifier extends _$PersonalEditNotifier {
  @override
  UpdateUserInfoDTO build(){
    return UpdateUserInfoDTO();
  }

  void setInitial(String? username,String? firstname,String? lastname){
    state = UpdateUserInfoDTO(userName: username,firstName: firstname,lastName: lastname);
  }

  void setUsername(String? username){
    state = UpdateUserInfoDTO(userName: username??state.userName,firstName: state.firstName , lastName: state.lastName);
  }

  void setFirstname(String? firstname){
    state = UpdateUserInfoDTO(userName: state.userName,firstName: firstname?? state.firstName , lastName: state.lastName);
  }

  void setLastname(String? lastname){
    state = UpdateUserInfoDTO(userName: state.userName,firstName: state.firstName , lastName: lastname?? state.lastName);
  }
}