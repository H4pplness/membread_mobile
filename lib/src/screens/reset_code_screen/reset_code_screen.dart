import 'package:flutter/material.dart';
import '../../widgets/molecules/otp/otp_form.dart';
import '../../widgets/organisms/app_bars/none_title_appbar.dart';
import '../../widgets/atoms/buttons/primary_text_button.dart';
import '../reset_password_screen/reset_password_screen.dart';

class ResetCodeScreen extends StatelessWidget {
  const ResetCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonTitleAppBar(onPressed: ()=>Navigator.pop(context),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You've got mail",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 30,),
                Text("We have sent the OTP verification code to your email address ",style: Theme.of(context).textTheme.displaySmall,overflow: TextOverflow.visible,),
                const SizedBox(height: 40,),
                OTPForm(),
              ],
            ),
            PrimaryTextButton(
              text: "Continue",
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen())),
            ),
          ],
        )
      ),
    );
  }
}
