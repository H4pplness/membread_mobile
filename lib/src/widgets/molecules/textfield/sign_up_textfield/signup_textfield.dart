import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membreadflutter/src/domain/notifiers/sign_up_message_notifier/sign_up_message_notifier.dart';
import 'package:membreadflutter/src/domain/repositories/user_repository/sign_up/sign_up.dart';
import 'package:membreadflutter/src/dtos/signupdto/sign_up_dto.dart';
import 'package:membreadflutter/src/widgets/molecules/textfield/sign_up_textfield/notifier/eye_password_notifier.dart';
import '../../../atoms/buttons/primarybutton.dart';
import '../../../atoms/text_fields/email_textfield.dart';
import '../../../atoms/text_fields/name_textfield.dart';
import '../../../atoms/text_fields/pass_textfield.dart';
import '../../../atoms/text_fields/phone_textfield.dart';

class SignUpTextField extends ConsumerWidget {
  SignUpTextField({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seePassword = ref.watch(eyePasswordNotifierProvider);
    final signUpNotifier = ref.watch(signUpMessageNotifierProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign up",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Enter your information to register new account and get some amazing courses",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              signUpNotifier != null
                  ? SizedBox(
                      height: 30,
                      child: Text(signUpNotifier,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w400)),
                    )
                  : SizedBox(
                      height: 30,
                    ),
              Text(
                "Email *",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                validator: (String? value) {
                  return (value != null && !value.contains('@'))
                      ? 'Email invalid'
                      : null;
                },
                controller: emailController,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Password *",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                validator: (String? value) {
                  return (value != null && value.length < 8)
                      ? 'Password at least 8 character'
                      : null;
                },
                controller: passwordController,
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
              const SizedBox(
                height: 30,
              ),
              Text(
                "Username *",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                validator: (String? username) {
                  return (username == null) ? 'Username invalid' : null;
                },
                controller: usernameController,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Firstname",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                controller: firstnameController,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Lastname",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              TextFormField(
                controller: lastnameController,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: PrimaryButton(
              width: MediaQuery.of(context).size.width - 40,
              child: Center(
                child: Text(
                  "Sign up",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final message = await ref.read(signUpProvider(SignUpDTO(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                          firstName: firstnameController.text,
                          lastName: lastnameController.text))
                      .future);
                  if(message!=null) ref.read(signUpMessageNotifierProvider.notifier).setMessage(message);
                  else{
                    Navigator.pop(context);
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
