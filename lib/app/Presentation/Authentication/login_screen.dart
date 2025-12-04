import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/Authentication/signup_screen.dart';
import 'package:task_manager/app/Presentation/TaksScreens/home_screen.dart';
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
  final auth = FirebaseAuth.instance;
  final _globalke = GlobalKey<FormState>();
  loguser() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      if (_globalke.currentState!.validate()) {
        UserCredential? userr = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userr != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("exception ${e.toString()}")));
    }
  }

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
                    ReTextfield(
                      lable: 'email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Add your email";
                        }
                        return null;
                      },
                    ),
                    Gap(10),
                    ReTextfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Add password";
                        }
                        return null;
                      },
                      keyboardype: TextInputType.emailAddress,
                      lable: 'email',
                      controller: passwordController,
                    ),

                    Gap(15),
                    ReElevatedButton(
                      onPressed: () async {
                        await loguser();
                      },
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
