import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/common/Textfields/retextfield.dart';

class DeatilsScreen extends StatefulWidget {
  String taskId;
  DeatilsScreen({super.key, required this.taskId});

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  TextEditingController headingController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final _firestore = FirebaseFirestore.instance.collection("tasks");
  getTask() async {
    DocumentSnapshot task = await _firestore.doc(widget.taskId).get();
    print('here is data ${task.data()}');
    return task.data();
  }

  @override
  void initState() {
    super.initState();
    getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Task_Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getTask(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            final data = snapshot.data as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["heading"] ?? "",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(10),
                    Text("Appointment with Cm", style: TextStyle(fontSize: 22)),
                    Gap(10),
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Gap(10),
                    Text(
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      data["details"],
                      style: TextStyle(fontSize: 18),
                    ),
                    Gap(15),
                    Text("Due date"),
                    Text("12-4-2025"),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
