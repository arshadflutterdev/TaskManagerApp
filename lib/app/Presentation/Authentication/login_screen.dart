import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/Authentication/signup_screen.dart';
import 'package:task_manager/app/common/Containers/stylish_container.dart';
import 'package:task_manager/app/common/Textfields/re_elevatedbutton.dart';
import 'package:task_manager/app/common/Textfields/re_textbutton.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: StylishContainer(
            heights: height * 0.55,
            widhts: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(15),
                    Text(
                      "WelCome Back😍",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(15),
                    ReTextfield(lable: 'email', controller: emailController),
                    Gap(10),
                    ReTextfield(
                      keyboardype: TextInputType.emailAddress,
                      lable: 'email',
                      controller: passwordController,
                    ),

                    Gap(15),
                    ReElevatedButton(
                      onPressed: () {},
                      text: 'Login to Account',
                    ),
                    Gap(10),
                    Text("Or signin with"),
                    ReTextbutton(
                      onPressed: () {},
                      text: 'Google',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Already haven't Account?"),
                        ReTextbutton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          text: "Signup",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
