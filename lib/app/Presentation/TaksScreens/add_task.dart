import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/TaksScreens/home_screen.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController headingController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final _firestore = FirebaseFirestore.instance.collection("tasks");
  final now = DateTime.now();
  uploadtask() async {
    String heading = headingController.text;
    String detail = detailsController.text;
    if (heading.isEmpty || detail.isEmpty) {
      return ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill all fields")));
    } else {
      try {
        final timestamp =
            "${now.hour}-${now.minute}-${now.day}-${now.month}-${now.year}";
        Map<String, dynamic> taskss = {
          "heading": heading,
          "details": detail,
          "createdAt": timestamp,
        };
        final taask = await _firestore.add(taskss);
        print("task details $taask");
        if (taask != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("error ${e.toString()}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.amber, size: 40),
        onPressed: () async {
          await uploadtask();
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Add Your Task"),
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
              ReTextfield(
                lable: "Add Heading",
                controller: headingController,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text(
                "Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
              Gap(10),
              ReTextfield(
                lable: "Add Heading",
                controller: detailsController,
                style: TextStyle(fontSize: 18),
              ),
              Gap(15),
              Text(
                "Select final date",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2025),
                lastDate: DateTime(2030),
                onDateChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
