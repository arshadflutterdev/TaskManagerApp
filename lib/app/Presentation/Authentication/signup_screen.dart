import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/Authentication/login_screen.dart';
import 'package:task_manager/app/Presentation/TaksScreens/home_screen.dart';
import 'package:task_manager/app/common/Containers/stylish_container.dart';
import 'package:task_manager/app/common/Textfields/re_elevatedbutton.dart';
import 'package:task_manager/app/common/Textfields/re_textbutton.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
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
            heights: height * 0.62,
            widhts: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(15),
                    Text(
                      "Create Your Account😍",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(15),
                    ReTextfield(lable: 'name', controller: nameController),
                    Gap(10),
                    ReTextfield(
                      keyboardype: TextInputType.emailAddress,
                      lable: 'email adress',
                      controller: nameController,
                    ),
                    Gap(10),
                    ReTextfield(
                      lable: 'password',
                      controller: nameController,
                      keyboardype: TextInputType.number,
                    ),
                    Gap(15),
                    ReElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      text: 'Create an Account',
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
                        Text("Already have an Account?"),
                        ReTextbutton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          text: "Login",
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
  }
}
