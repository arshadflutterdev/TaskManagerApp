import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/app/Presentation/TaksScreens/add_task.dart';
import 'package:task_manager/app/Presentation/TaksScreens/deatils_screen.dart';
import 'package:task_manager/app/Presentation/TaksScreens/update_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance.collection("tasks");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(CupertinoIcons.add_circled, size: 40, color: Colors.amber),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
      ),
      appBar: AppBar(
        title: Text("To-Do-List"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: _firestore.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          } else if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          } else {
            final data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final doc = data[index];
                final docdata = doc.data() as Map<String, dynamic>;
                docdata["docId"] = doc.id;

                return Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      docdata["docId"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doc["details"]),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeatilsScreen(task: "docId"),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_forward_ios, size: 15),
                              Gap(2),
                              Text("details", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,

                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateTask(),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),

                          Icon(
                            CupertinoIcons.timer,
                            color: Colors.green,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
