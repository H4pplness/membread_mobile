import 'package:flutter/material.dart';
import '../../widgets/molecules/textfield/login_texfield/login_textfield.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NonTitleAppBar(onPressed: ()=>Navigator.pop(context)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: LoginTextField(),
      ),
    );
  }
}
