import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class DeatilsScreen extends StatefulWidget {
  const DeatilsScreen({super.key});

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  TextEditingController headingController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Task Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Heading",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text("Appointment with Cm", style: TextStyle(fontSize: 22)),
              Gap(10),
              Text(
                "Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
              Gap(10),
              Text(
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                "psum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of ",
                style: TextStyle(fontSize: 18),
              ),
              Gap(15),
              Text("Due date"),
              Text("12-4-2025"),
            ],
          ),
        ),
      ),
    );
  }
}
