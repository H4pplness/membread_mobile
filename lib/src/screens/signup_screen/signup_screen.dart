import 'package:flutter/material.dart';
import '../../widgets/molecules/textfield/signup_textfield.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        appBar: NonTitleAppBar(
          onPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const SignInTextField(),
          ),
        )
    );
  }
}
