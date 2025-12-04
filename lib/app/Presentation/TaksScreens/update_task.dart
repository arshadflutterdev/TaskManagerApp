import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({super.key});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController headingController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.update, color: Colors.amber, size: 40),
        onPressed: () {
          Navigator.pop(context);
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
                controller: headingController,
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
    ;
  }
}
