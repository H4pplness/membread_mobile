import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:membreadflutter/src/database/local/token/auth/login.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/checkboxs/checkbox.dart';
import '../../../screens/forgot_pass_screen/forgot_pass_page.dart';
import '../../atoms/buttons/primarybutton.dart';
import '../../atoms/text_fields/email_textfield.dart';
import '../../atoms/text_fields/pass_textfield.dart';

class LoginTextField extends ConsumerStatefulWidget {
  LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello there",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            EmailTextField(
              controller: emailController,
            ),
            const SizedBox(height: 30),
            PassTextField(
              controller: passController,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const CheckBox(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Remember me",
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassScreen()));
                  },
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  )),
            ),
          ],
        ),
        PrimaryButton(
          onPressed: () async {
            final loginFuture = ref.read(loginProvider(LoginParams(
              email: emailController.text,
              password: passController.text,
            )).future);

            // Set loading status
            setState(() {
              status = true;
            });

            loginFuture.then((result) {
              if (result) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NewHomeScreen()),
                );
              }
            }).catchError((error) {
              // Handle error
              setState(() {
                status = false;
              });
              // Display error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed: $error')),
              );
            });
          },
          width: MediaQuery.of(context).size.width - 40,
          child: Center(
            child: status
                ? CircularProgressIndicator()
                : Text(
              "Sign in",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        )
      ],
    );
  }
}
