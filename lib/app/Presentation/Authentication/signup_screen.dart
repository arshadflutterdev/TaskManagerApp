import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/common/Containers/stylish_container.dart';
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
            heights: height * 0.60,
            widhts: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Gap(15),
                  Text(
                    "Create Your Account😍",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Gap(15),
                  ReTextfield(lable: 'name', controller: nameController),
                  Gap(10),
                  ReTextfield(
                    lable: 'email adress',
                    controller: nameController,
                  ),
                  Gap(10),
                  ReTextfield(lable: 'password', controller: nameController),
                  Gap(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
