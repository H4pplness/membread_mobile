import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/database/local/token/auth/login.dart';
import 'package:membreadflutter/src/database/local/token/auth/login_with_google.dart';
import 'package:membreadflutter/src/screens/new_home_screen/new_home_screen.dart';
import 'package:membreadflutter/src/widgets/atoms/buttons/border_button.dart';
import 'package:membreadflutter/src/widgets/atoms/checkboxs/checkbox.dart';
import '../../../../screens/forgot_pass_screen/forgot_pass_page.dart';
import '../../../atoms/buttons/primarybutton.dart';
import '../../../atoms/text_fields/email_textfield.dart';
import '../../../atoms/text_fields/pass_textfield.dart';
import '../sign_up_textfield/notifier/eye_password_notifier.dart';

class LoginTextField extends ConsumerStatefulWidget {
  LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool status = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final seePassword = ref.watch(eyePasswordNotifierProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              Text(
                "Email",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                controller: emailController,
                validator: (String? email) {
                  return (email != null && !email.contains('@'))
                      ? 'Email invalid'
                      : null;
                },
              ),
              const SizedBox(height: 30),
              Text(
                "Password",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                controller: passController,
                validator: (String? value) {
                  return (value != null && value.length < 8)
                      ? 'Password at least 8 character'
                      : null;
                },
                obscureText: !seePassword,
                decoration: InputDecoration(
                    suffixIcon: seePassword
                        ? GestureDetector(
                            child: const Icon(Icons.visibility),
                            onTap: () => ref
                                .read(eyePasswordNotifierProvider.notifier)
                                .swapState(),
                          )
                        : GestureDetector(
                            child: const Icon(Icons.visibility_off),
                            onTap: () => ref
                                .read(eyePasswordNotifierProvider.notifier)
                                .swapState(),
                          )),
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
          const SizedBox(
            height: 20,
          ),
          PrimaryButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
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
              }
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
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.grey,
              ),
              Text(
                "Or",
                style: GoogleFonts.montserrat(fontSize: 17, color: Colors.grey),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 20,),
          BorderButton(
            onPressed: () async {
              final loginFuture = ref.read(loginWithGoogleProvider.future);

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
            color: Colors.white,
            borderColor: Colors.grey[400],
            child: Row(
              children: [
                Image.asset(
                  "assets/google.jpg",
                  width: 25,
                  height: 25,
                ),
                Expanded(
                    child: Center(
                  child: Text("Login with Google",style: GoogleFonts.montserrat(fontSize:19,color:Colors.black,fontWeight:FontWeight.w500),),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
