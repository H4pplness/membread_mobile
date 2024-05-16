import 'package:flutter/material.dart';

import '../../widgets/atoms/text_fields/forgot_pass_textfield.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        appBar: NonTitleAppBar(onPressed: ()=>Navigator.pop(context)),
        body: Container(
          padding: const EdgeInsets.all(20),
          child:const ForgotPassTextField(),
        ));
  }
}

