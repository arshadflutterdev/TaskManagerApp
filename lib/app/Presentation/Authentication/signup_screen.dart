import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  final _firestore = FirebaseFirestore.instance.collection("taskmanagerusers");
  final auth = FirebaseAuth.instance;
  userauth() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("fill fields")));
    }
    try {
      UserCredential? userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        Map<String, dynamic> userss = {
          "name": name,
          "email": email,
          "password": password,
        };
        _firestore.add(userss);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error ${e.toString()}")));
    }
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  //signin with google
  signingoogle() async {
    final signin = GoogleSignIn.instance;
    await signin.initialize(
      serverClientId:
          "495185543742-kf8cekehr5gv4c5l39ilhmisj3midn3n.apps.googleusercontent.com",
    );
    try {
      final GoogleSignInAccount? usersign = await signin.authenticate();
      if (usersign == null) {
        return;
      }
      final GoogleSignInAuthentication userauth = usersign.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: userauth.idToken,
      );
      if (credential != null) {
        Map<String, dynamic> googleuser = {"usercredential": credential};
        _firestore.add(googleuser);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      return await auth.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error ${e.toString()}")));
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
            heights: height * 0.62,
            widhts: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey,
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
                      ReTextfield(
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        lable: 'name',
                        controller: nameController,
                      ),
                      Gap(10),
                      ReTextfield(
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return "Please enter email";
                          }
                          return null;
                        },
                        keyboardype: TextInputType.emailAddress,
                        lable: 'email adress',
                        controller: emailController,
                      ),
                      Gap(10),
                      ReTextfield(
                        validator: (value) {
                          if (value.isEmpty || value == null) {
                            return "create password";
                          }
                          return null;
                        },
                        lable: 'password',
                        controller: passwordController,
                        keyboardype: TextInputType.number,
                      ),
                      Gap(15),
                      ReElevatedButton(
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            await userauth();
                          }
                        },
                        text: 'Create an Account',
                      ),
                      Gap(10),
                      Text("Or signin with"),
                      ReTextbutton(
                        onPressed: () async {
                          await signingoogle();
                        },
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
      ),
    );
  }
}
