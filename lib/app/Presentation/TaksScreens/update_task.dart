import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class UpdateTask extends StatefulWidget {
  final String taskId;
  const UpdateTask({super.key, required this.taskId});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController headingController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _firestore = FirebaseFirestore.instance.collection("tasks");

  getTask() async {
    DocumentSnapshot docss = await _firestore.doc(widget.taskId).get();
    final dataa = docss.data();
    if (dataa != null) {
      headingController.text = docss["heading"];
      detailsController.text = docss["details"];
      setState(() {
        updatedController.text = docss["updatedAt"] ?? "yet not updated";
      });
      print("here is data$dataa");
    }
    return dataa;
  }

  void initState() {
    super.initState();
    getTask();
  }

  final time = DateTime.now();

  //update task
  taskupdate() async {
    try {
      final formatedtime =
          "${time.hour}-${time.minute}-${time.day}-${time.month}-${time.year}";
      Map<String, dynamic> taskupdate = {
        "heading": headingController.text.trim(),
        "details": detailsController.text.trim(),

        "updatedAt": formatedtime,
      };
      _firestore.doc(widget.taskId).update(taskupdate);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Your Task Updated")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error  ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.update, color: Colors.amber, size: 40),
        onPressed: () async {
          await taskupdate();
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Update Your Task"),
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
              Row(
                children: [
                  Text(
                    "Heading",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("Updated At${updatedController.text} "),
                ],
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
    ;
  }
}
