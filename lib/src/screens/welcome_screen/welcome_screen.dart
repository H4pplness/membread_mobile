import 'package:flutter/material.dart';
import 'package:membreadflutter/src/screens/login_screen/login_screen.dart';
import 'package:membreadflutter/src/screens/signup_screen/signup_screen.dart';

import '../../widgets/atoms/buttons/lightbutton.dart';
import '../../widgets/atoms/buttons/primarybutton.dart';
import '../../widgets/atoms/logo/membreadlogo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: Container(),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hi there! I'm Bread",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Center(
                child: MemBreadLogo(
                  size: 70,
                ),
              ),
              Text(
                "Let's eat memory bread",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Column(
                children: [
                  PrimaryButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen())),
                      width: MediaQuery.of(context).size.width - 40,
                      child: Center(
                          child: Text(
                        "Get started",
                        style: Theme.of(context).textTheme.labelMedium,
                      ))),
                  LightButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen())),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Center(
                      child: Text("I already have an account",
                          style: Theme.of(context).textTheme.displayMedium),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
