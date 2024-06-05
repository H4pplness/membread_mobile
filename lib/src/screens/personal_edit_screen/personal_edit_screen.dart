import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/user/logined_user.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/update_user_info/update_user_info.dart';
import 'package:membreadflutter/src/dtos/updateuserinfodto/updateuserinfodto.dart';
import 'package:membreadflutter/src/screens/personal_edit_screen/notifiers/personal_edit_notifier.dart';
import 'package:membreadflutter/src/widgets/atoms/cards/userinfo_card.dart';
import 'package:membreadflutter/src/widgets/molecules/dialog/edit_personal_dialog/edit_personal_dialog.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';

class PersonalEditScreen extends ConsumerStatefulWidget {
  const PersonalEditScreen({super.key});

  @override
  ConsumerState<PersonalEditScreen> createState() => _PersonalEditScreenState();
}

class _PersonalEditScreenState extends ConsumerState<PersonalEditScreen> {
  bool _isFirsttime = true;
  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirsttime) {
      final username = ref.watch(loginedUserProvider).getUserName();
      final firstname = ref.watch(loginedUserProvider).getFirstName();
      final lastname = ref.watch(loginedUserProvider).getLastName();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .read(personalEditNotifierProvider.notifier)
            .setInitial(username, firstname, lastname);
      });
      setState(() {
        _isFirsttime = false;
      });
    }
  }

  _buildUsernameDialog(WidgetRef ref) {
    usernameController.text = ref.watch(loginedUserProvider).getUserName()!;
    showDialog(
        context: context,
        builder: (context) {
          return EditPersonalDialog(
              title: "Username",
              controller: usernameController,
              onSave: () {
                ref
                    .read(personalEditNotifierProvider.notifier)
                    .setUsername(usernameController.text);
              });
        });
  }

  _buildFirstnameDialog(WidgetRef ref) {
    firstnameController.text = ref.watch(loginedUserProvider).getFirstName()!;
    showDialog(
        context: context,
        builder: (context) {
          return EditPersonalDialog(
              title: "Firstname",
              controller: firstnameController,
              onSave: () {
                ref
                    .read(personalEditNotifierProvider.notifier)
                    .setFirstname(firstnameController.text);
              });
        });
  }

  _buildLastnameDialog(WidgetRef ref) {
    lastnameController.text = ref.watch(loginedUserProvider).getLastName()!;
    showDialog(
        context: context,
        builder: (context) {
          return EditPersonalDialog(
              title: "Lastname",
              controller: lastnameController,
              onSave: () {
                ref
                    .read(personalEditNotifierProvider.notifier)
                    .setLastname(lastnameController.text);
              });
        });
  }

  _onSave() async {
    setState(() {
      _isLoading = true;
    });
    final userInfo = ref.watch(personalEditNotifierProvider);
    await ref.read(updateUserInfoProvider(userInfo).future);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginedUser = ref.watch(personalEditNotifierProvider);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: NonTitleAppBar(
            onPressed: () => Navigator.pop(context),
            actions: [
              TextButton(
                  onPressed: () async {
                    await _onSave();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
            ],
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInfoCard(
                    title: "Username",
                    content: loginedUser.userName ?? "",
                    onPressed: () => _buildUsernameDialog(ref),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UserInfoCard(
                    title: "Firstname",
                    content: loginedUser.firstName ?? "",
                    onPressed: () => _buildFirstnameDialog(ref),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  UserInfoCard(
                    title: "Lastname",
                    content: loginedUser.lastName ?? "",
                    onPressed: () => _buildLastnameDialog(ref),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading)
          Stack(
            children: [
              Opacity(
                opacity: 0.5, // Độ mờ khi đang loading
                child: Container(
                  color: Colors.black, // Màu nền
                ),
              ),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),

      ],
    );
  }
}
