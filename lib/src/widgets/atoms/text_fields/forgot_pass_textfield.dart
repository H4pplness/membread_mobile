import 'package:flutter/material.dart';
import '../../../screens/reset_code_screen/reset_code_screen.dart';
import '../../atoms/text_fields/email_textfield.dart';
import '../buttons/primarybutton.dart';

class ForgotPassTextField extends StatefulWidget {
  const ForgotPassTextField({Key? key}) : super(key: key);

  @override
  State<ForgotPassTextField> createState() => _ForgotPassTextFieldState();
}

class _ForgotPassTextFieldState extends State<ForgotPassTextField> {
  late bool status ;
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = true;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter your email address to get an OTP code to reset password.",
              style: Theme.of(context).textTheme.displaySmall,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: 40,
            ),
            EmailTextField(controller: emailController),
            const SizedBox(height: 15,),
            status == false ? const Text("Email not exist",style: TextStyle(
                fontSize: 15,color: Colors.red,fontWeight: FontWeight.w400
            ),): Container(),
          ],
        ),
        PrimaryButton(width: MediaQuery.of(context).size.width - 40,
          child: Center(
            child: Text(
              "Continue",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetCodeScreen())),
          // onPressed: () {
            // final response = await User.reset(emailController.text);
            // if(response.statusCode == 200){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetCodePage()));
            // }else{
            //   print(response.statusCode);
            //   setState(() {
            //     status = false;
            //   });
            // }
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetCodeScreen()));
            // },
        )
      ],
    );
  }
}
