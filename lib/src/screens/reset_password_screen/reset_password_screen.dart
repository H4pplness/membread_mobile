import 'package:flutter/material.dart';
import '../../widgets/atoms/buttons/primary_text_button.dart';
import '../../widgets/atoms/text_fields/pass_textfield.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonTitleAppBar(onPressed:()=> Navigator.pop(context),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create new password",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 40,),
                Text("Save the new password in a safe place, if you forget it then you have to do a forgot password again .",style: Theme.of(context).textTheme.displaySmall,),
                const SizedBox(height: 20,),
                PassTextField(title: "New password",),
                const SizedBox(height: 20,),
                PassTextField(title: "Confirm",)
              ],
            ),
            PrimaryTextButton(text: "Continue"),
          ],
        ),
      ),
    );
  }
}
